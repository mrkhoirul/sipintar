import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../users/login.dart';
import '../users/profile.dart';
import '../submapel/programming.dart';
import '../submapel/cyber.dart';
import 'package:sipintar/global.dart' as global;

class ItPage extends StatefulWidget {
  const ItPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ItPageState createState() => _ItPageState();
}

class _ItPageState extends State<ItPage> {
  late double width;

  @override
  void initState() {
    super.initState();
    if (global.username.length <= 9) {
      width = 160.0;
    } else if (global.username.length <= 13) {
      width = 190.0;
    } else if (global.username.length <= 20) {
      width = 230.0;
    }
  }

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
                  height: 135,
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
                              const SizedBox(width: 5),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Container(
                              width: width,
                              alignment: Alignment.topRight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color.fromARGB(255, 140, 199, 254),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 140, 199, 254),
                                  width: 2,
                                ),
                              ),
                              child: GestureDetector(
                                onTapDown: (detail) {
                                  showMenu(
                                    context: context,
                                    position: const RelativeRect.fromLTRB(
                                        75.0, 75.0, 0.0, 0.0),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    items: [
                                      PopupMenuItem(
                                        value: 'profile',
                                        onTap: () =>
                                            Get.to(const ProfilePage()),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.person,
                                              color: Color(0xFF22355C),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              child: Text(
                                                'Profile',
                                                style: TextStyle(
                                                  color: Color(0xFF22355C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: 'logout',
                                        onTap: () => Get.to(const LoginPage()),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.logout,
                                              color: Color(0xFF22355C),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              child: Text(
                                                'Logout',
                                                style: TextStyle(
                                                  color: Color(0xFF22355C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Text(
                                        'Hai, ${global.username}!',
                                        style: const TextStyle(
                                          color: Color(0xFF22355C),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.person,
                                      color: Color(0xFF22355C),
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F7),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          cursorHeight: 20,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: "Search",
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "IT",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 30, 53),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 250,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CyberPage()),
                            );
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: const Center(
                            child: Text(
                              "Cyber Security",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 250,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      const ProgrammingPage()),
                            );
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: const Center(
                            child: Text(
                              "Programming",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
