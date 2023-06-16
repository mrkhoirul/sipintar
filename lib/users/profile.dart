import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
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
                    const SizedBox(
                      height: 5,
                    ),
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
                                const SizedBox(
                                  width: 150,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/images/SiPintar.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 0,
                    ),
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
                )
              ],
            ),
            SizedBox(
                width: 500,
                height: 50,
                child: Stack(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 10,
                      child: Column(
                        children: const [
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: Text(
                              "Username : ahmadasep",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
                width: 500,
                height: 50,
                child: Stack(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 10,
                      child: Column(
                        children: const [
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: Text(
                              "Email: asep@gmail.com",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
                width: 500,
                height: 50,
                child: Stack(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 10,
                      child: Column(
                        children: const [
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: Text(
                              "Password:               ******",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
                width: 500,
                height: 50,
                child: Stack(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 10,
                      child: Column(
                        children: const [
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: Text(
                              "Phone:   +6293794087",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
