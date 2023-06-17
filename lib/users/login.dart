import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../localnotification.dart';
import '../bottomnavigationbar.dart';
import 'forgotpassword.dart';
import 'register.dart';
import '../global.dart' as global;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var passwordVisibility;

  @override
  void initState() {
    super.initState();
    passwordVisibility = true;
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');

    Future<String> checkUsername(String username) async {
      final QuerySnapshot result =
          await users.where("username", isEqualTo: username).get();
      final List<DocumentSnapshot> documents = result.docs;
      for (var element in documents) {
        Map<String, dynamic> datae = element.data() as Map<String, dynamic>;
        if (datae['username'] == username) {
          return datae['username'];
        }
      }
      return '';
    }

    Future<String> checkPassword(String password) async {
      final QuerySnapshot result =
          await users.where("password", isEqualTo: password).get();
      final List<DocumentSnapshot> documents = result.docs;
      for (var element in documents) {
        Map<String, dynamic> datae = element.data() as Map<String, dynamic>;
        if (datae['password'] == password) {
          return datae['password'];
        }
      }
      return '';
    }

    Future<String> checkEmail(String username) async {
      final QuerySnapshot result =
          await users.where("username", isEqualTo: username).get();
      final List<DocumentSnapshot> documents = result.docs;
      for (var element in documents) {
        Map<String, dynamic> datae = element.data() as Map<String, dynamic>;
        return datae['email'];
      }
      return '';
    }

    Future<String> getDocumentId(String username) async {
      final QuerySnapshot result =
          await users.where("username", isEqualTo: username).get();
      final List<DocumentSnapshot> documents = result.docs;
      for (var element in documents) {
        return element.id;
      }
      return '';
    }

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/images/SiPintar.png'),
      ),
    );

    final username = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: usernameController,
      autofocus: false,
      decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: const TextStyle(color: Color(0xFF8CC7FE)),
          suffixIcon: const Icon(Icons.person, color: Color(0xFF8CC7FE)),
          filled: true,
          fillColor: const Color(0xFF2985DA),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(color: Color(0xFF2946DA))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(color: Color(0xFF8CC7FE)))),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: passwordVisibility,
      controller: passwordController,
      decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: const TextStyle(color: Color(0xFF8CC7FE)),
          suffixIcon: IconButton(
              icon: passwordVisibility
                  ? const Icon(Icons.visibility, color: Color(0xFF8CC7FE))
                  : const Icon(Icons.visibility_off, color: Color(0xFF8CC7FE)),
              onPressed: () {
                setState(() {
                  passwordVisibility = !passwordVisibility;
                });
              }),
          filled: true,
          fillColor: const Color(0xFF2985DA),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(color: Color(0xFF2946DA))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(color: Color(0xFF8CC7FE)))),
    );

    final loginButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(12),
              backgroundColor: const Color(0xFF22355C)),
          child: const Text('Log In', style: TextStyle(color: Colors.white)),
          onPressed: () async {
            var usernameFire = await checkUsername(usernameController.text);
            var passwordFire = await checkPassword(passwordController.text);
            var emailFire = await checkEmail(usernameController.text);
            var documentId = await getDocumentId(usernameController.text);
            if (usernameController.text == '') {
              LocalNotificationService().showNotif(
                  title: 'Login Gagal', body: 'Username masih kosong.');
            } else if (passwordController.text == '') {
              LocalNotificationService().showNotif(
                  title: 'Login Gagal', body: 'Password masih kosong.');
            } else {
              if (usernameController.text != usernameFire) {
                LocalNotificationService().showNotif(
                    title: 'Login Gagal', body: 'Username tidak terdaftar.');
              } else if (passwordController.text != passwordFire) {
                LocalNotificationService()
                    .showNotif(title: 'Login Gagal', body: 'Password salah.');
              } else {
                LocalNotificationService().showNotif(
                    title: 'Login Berhasil',
                    body: 'Login telah berhasil dilakukan!');
                global.username = usernameFire;
                global.email = emailFire;
                global.password = passwordFire;
                global.documentId = documentId;
                // ignore: use_build_context_synchronously
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const BottomNavigationBarPage();
                }));
              }
            }
          }),
    );

    final forgotLabel = GestureDetector(
      child: const Padding(
        padding: EdgeInsets.only(left: 110, right: 90.0),
        child: Text(
          'Forgot password?',
          style: TextStyle(color: Color(0xFF2985DA)),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ForgotPasswordPage();
          },
        ),
      ),
    );

    final dontHaveAccountLabel = GestureDetector(
      child: const Padding(
        padding: EdgeInsets.only(left: 100.0, right: 80.0),
        child: Text(
          'Dont have account?',
          style: TextStyle(color: Color(0xFF2985DA)),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const RegisterPage();
          },
        ),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF8CC7FE),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            const SizedBox(height: 48.0),
            username,
            const SizedBox(height: 8.0),
            password,
            const SizedBox(height: 24.0),
            loginButton,
            forgotLabel,
            dontHaveAccountLabel
          ],
        ),
      ),
    );
  }
}
