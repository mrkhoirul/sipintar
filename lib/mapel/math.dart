import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../users/login.dart';
import '../users/profile.dart';
import '../submapel/calculus.dart';
import '../submapel/algebra.dart';

class MathPage extends StatefulWidget {
  const MathPage({super.key});

  @override
  _MathPageState createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
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
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/SiPintar.png"),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "SiPintar",
                                style: TextStyle(
                                  color: Color(0xFF021E35),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Container(
                              width: 120.0,
                              alignment: Alignment.topRight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color.fromARGB(255, 140, 199, 254),
                                border: Border.all(
                                  color: const Color.fromARGB(255, 140, 199, 254),
                                  width: 2,
                                ),
                              ),
                              child: GestureDetector(
                                onTapDown: (detail) {
                                  showMenu(
                                    context: context,
                                    position: const RelativeRect.fromLTRB(75.0, 75.0, 0.0, 0.0),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    items: [
                                      PopupMenuItem(
                                        value: 'profile',
                                        onTap: () => Get.to(const ProfilePage()),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.person,
                                              color: Color(0xFF22355C),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 10.0),
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
                                              padding: EdgeInsets.only(left: 10.0),
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
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: Text(
                                        'Hai, user!',
                                        style: TextStyle(
                                          color: Color(0xFF22355C),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Icon(
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
                              MaterialPageRoute(builder: (context) => const AlgebraPage()),
                            );
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: const Center(
                            child: Text(
                              "Algebra",
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
                              MaterialPageRoute(builder: (builder) => const CalculusPage()),
                            );
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: const Center(
                            child: Text(
                              "Calculus",
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
