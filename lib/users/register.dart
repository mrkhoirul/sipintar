import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../localnotification.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var passwordVisibility;
  // ignore: prefer_typing_uninitialized_variables
  var confirmPasswordVisibility;

  @override
  void initState() {
    super.initState();
    passwordVisibility = true;
    confirmPasswordVisibility = true;
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');

    FocusNode usernameFocusNode = FocusNode();
    FocusNode emailFocusNode = FocusNode();

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

    Future<String> checkEmail(String email) async {
      final QuerySnapshot result =
          await users.where("email", isEqualTo: email).get();
      final List<DocumentSnapshot> documents = result.docs;
      for (var element in documents) {
        Map<String, dynamic> datae = element.data() as Map<String, dynamic>;
        if (datae['email'] == email) {
          return datae['email'];
        }
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

    var username = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: usernameController,
      focusNode: usernameFocusNode,
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

    var email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      focusNode: emailFocusNode,
      autofocus: false,
      decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: const TextStyle(color: Color(0xFF8CC7FE)),
          suffixIcon: const Icon(Icons.email, color: Color(0xFF8CC7FE)),
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

    final confirmPassword = TextFormField(
      autofocus: false,
      obscureText: confirmPasswordVisibility,
      controller: confirmPasswordController,
      decoration: InputDecoration(
          labelText: 'Confirm Password',
          labelStyle: const TextStyle(color: Color(0xFF8CC7FE)),
          suffixIcon: IconButton(
              icon: confirmPasswordVisibility
                  ? const Icon(Icons.visibility, color: Color(0xFF8CC7FE))
                  : const Icon(Icons.visibility_off, color: Color(0xFF8CC7FE)),
              onPressed: () {
                setState(() {
                  confirmPasswordVisibility = !confirmPasswordVisibility;
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

    final registerButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.all(12),
            backgroundColor: const Color(0xFF22355C)),
        onPressed: () async {
          if (passwordController.text == confirmPasswordController.text) {
            var usernameFire = await checkUsername(usernameController.text);
            var emailFire = await checkEmail(emailController.text);
            var isValidEmail = EmailValidator.validate(emailController.text);
            if (usernameFire != '') {
              usernameController.text = '';
              usernameFocusNode.requestFocus();
              LocalNotificationService().showNotif(
                  title: 'Register Gagal', body: 'Username telah digunakan.');
            } else if (emailFire != '') {
              emailController.text = '';
              emailFocusNode.requestFocus();
              LocalNotificationService().showNotif(
                  title: 'Register Gagal', body: 'Email telah digunakan.');
            } else {
              if(!isValidEmail) {
                emailFocusNode.requestFocus();
                LocalNotificationService().showNotif(
                    title: 'Register Gagal', body: 'Email tidak valid.');
              } else {
                users.add({
                  'username': usernameController.text,
                  'email': emailController.text,
                  'password': passwordController.text
                }).then((DocumentReference doc) => LocalNotificationService()
                    .showNotif(
                        title: 'Register Berhasil',
                        body: 'Register telah berhasil dilakukan!'));
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ),
                );
              }
            }
          } else {
            LocalNotificationService().showNotif(
                title: 'Register Gagal',
                body: 'Password dan Confirm Password tidak sama.');

            usernameController.text = '';
            emailController.text = '';
            passwordController.text = '';
            confirmPasswordController.text = '';
            FocusScope.of(context).unfocus();
          }
        },
        child: const Text('Register', style: TextStyle(color: Colors.white)),
      ),
    );

    final alreadyAccountLabel = GestureDetector(
      child: const Padding(
        padding: EdgeInsets.only(left: 116.0, right: 58.0),
        child: Text(
          'Already have account?',
          style: TextStyle(color: Color(0xFF2985DA)),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const LoginPage();
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
            email,
            const SizedBox(height: 8.0),
            password,
            const SizedBox(height: 8.0),
            confirmPassword,
            const SizedBox(height: 24.0),
            registerButton,
            alreadyAccountLabel
          ],
        ),
      ),
    );
  }
}
