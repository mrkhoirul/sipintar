import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sipintar/global.dart' as global;
import 'package:sipintar/localnotification.dart';
import 'package:sipintar/users/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // ignore: prefer_typing_uninitialized_variables
  var passwordVisibility;
  // ignore: prefer_typing_uninitialized_variables
  var passwordUpdateVisibility;
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordVisibility = true;
    passwordUpdateVisibility = true;
    usernameController.text = global.username;
    emailController.text = global.email;
    passwordController.text = global.password;
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

    return Scaffold(
      backgroundColor: const Color(0xFF8CC7FE),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  color: const Color(0xFF021E35),
                ),
                Column(
                  children: [
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Color.fromARGB(255, 140, 199, 254),
                                    size: 30,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 140),
                              Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/images/SiPintar.png',
                                  width: 50,
                                  height: 50,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(150),
                                      border: Border.all(
                                          color: Colors.black,
                                          style: BorderStyle.solid,
                                          width: 2),
                                      color: const Color.fromARGB(
                                          255, 243, 237, 217)),
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.black,
                                    size: 150,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  60),
                                          side: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        iconColor: Colors.black,
                                        backgroundColor:
                                            const Color(0xFFF5F6F9),
                                      ),
                                      onPressed: () {
                                        // _editProfile();
                                      },
                                      child: const Icon(
                                          Icons.camera_alt_outlined)),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                SizedBox(
                  width: 500,
                  height: 65,
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            // ignore: unnecessary_brace_in_string_interps
                            "Username : ${global.username}",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 500,
                  height: 65,
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            // ignore: unnecessary_brace_in_string_interps
                            "Email          : ${global.email}",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 500,
                  height: 65,
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            passwordVisibility == true
                                ? 'Password   : ${global.password.replaceAll(RegExp(r"."), "*")}'
                                : "Password   : ${global.password}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          Positioned(
                              child: IconButton(
                            icon: passwordVisibility
                                ? const Icon(Icons.visibility,
                                    color: Color(0xFF22355C))
                                : const Icon(Icons.visibility_off,
                                    color: Color(0xFF22355C)),
                            onPressed: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                              });
                            },
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(children: [
                      const Text(
                        "Update Data",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Theme(
                        data: ThemeData(primaryColor: const Color(0xFF22355C)),
                        child: TextFormField(
                          autofocus: false,
                          controller: usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle:
                                const TextStyle(color: Color(0xFF22355C)),
                            suffixIcon: const Icon(Icons.person,
                                color: Color(0xFF22355C)),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 20.0, 10.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Theme(
                        data: ThemeData(primaryColor: const Color(0xFF22355C)),
                        child: TextFormField(
                          autofocus: false,
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle:
                                const TextStyle(color: Color(0xFF22355C)),
                            suffixIcon: const Icon(Icons.email,
                                color: Color(0xFF22355C)),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 20.0, 10.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Theme(
                        data: ThemeData(primaryColor: const Color(0xFF22355C)),
                        child: TextFormField(
                          autofocus: false,
                          obscureText: passwordUpdateVisibility,
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle:
                                const TextStyle(color: Color(0xFF22355C)),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordUpdateVisibility =
                                      !passwordUpdateVisibility;
                                });
                              },
                              icon: passwordUpdateVisibility
                                  ? const Icon(Icons.visibility,
                                      color: Color(0xFF22355C))
                                  : const Icon(Icons.visibility_off,
                                      color: Color(0xFF22355C)),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 20.0, 10.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(150.0, 0.0, 0.0, 0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              padding: const EdgeInsets.all(12),
                              backgroundColor: const Color(0xFF22355C),
                            ),
                            onPressed: () async {
                              if (usernameController.text != global.username) {
                                var tempUsername = await checkUsername(
                                    usernameController.text);
                                // ignore: unrelated_type_equality_checks
                                if (usernameController.text == tempUsername) {
                                  LocalNotificationService().showNotif(
                                      title: 'Update Data Gagal',
                                      body:
                                          'Username telah tersedia, silahkan ganti username lain.');
                                  Get.forceAppUpdate();
                                } else {
                                  users.doc(global.documentId).update({
                                    'username': usernameController.text,
                                    'email': emailController.text,
                                    'password': passwordController.text
                                  }).then((value) {
                                    LocalNotificationService().showNotif(
                                        title: 'Update Data Berhasil',
                                        body: 'Data telah berhasil diupdate');
                                    global.username = usernameController.text;
                                    global.email = emailController.text;
                                    global.password = passwordController.text;
                                    Get.forceAppUpdate();
                                  }).catchError((error) {
                                    LocalNotificationService().showNotif(
                                        title: 'Update Data Gagal',
                                        body: 'Data gagal diupdate');
                                  });
                                }
                              } else if (emailController.text != global.email) {
                                var tempEmail = await checkEmail(
                                    emailController.text);
                                // ignore: unrelated_type_equality_checks
                                if (usernameController.text == tempEmail) {
                                  LocalNotificationService().showNotif(
                                      title: 'Update Data Gagal',
                                      body:
                                          'Email telah tersedia, silahkan ganti email lain.');
                                  Get.forceAppUpdate();
                                } else {
                                  users.doc(global.documentId).update({
                                    'username': usernameController.text,
                                    'email': emailController.text,
                                    'password': passwordController.text
                                  }).then((value) {
                                    LocalNotificationService().showNotif(
                                        title: 'Update Data Berhasil',
                                        body: 'Data telah berhasil diupdate');
                                    global.username = usernameController.text;
                                    global.email = emailController.text;
                                    global.password = passwordController.text;
                                    Get.forceAppUpdate();
                                  }).catchError((error) {
                                    LocalNotificationService().showNotif(
                                        title: 'Update Data Gagal',
                                        body: 'Data gagal diupdate');
                                  });
                                }
                              }
                            },
                            child: const Text('Update',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              padding: const EdgeInsets.all(12),
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                        'Confirmation Delete Account',
                                        textAlign: TextAlign.center),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Text(
                                            'Are you sure want to delete account?',
                                            style: TextStyle(
                                                color: Color(0xFF22355C))),
                                        SizedBox(height: 16.0),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Yes'),
                                        onPressed: () {
                                          users
                                              .doc(global.documentId)
                                              .delete()
                                              .then((value) {
                                            LocalNotificationService().showNotif(
                                                title: 'Hapus Data Berhasil',
                                                body:
                                                    'Data telah terhapus, silahkan login kembali.');
                                            global.clear();
                                            Get.to(() => const LoginPage());
                                          }).catchError((error) {
                                            LocalNotificationService()
                                                .showNotif(
                                                    title: 'Hapus Data Gagal',
                                                    body:
                                                        'Data gagal dihapus.');
                                          });
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text('Delete',
                                style: TextStyle(color: Colors.white)),
                          ),
                        )
                      ])
                    ])),
              ],
            ))),
          ],
        ),
      ),
    );
  }
}
