import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../users/login.dart';
import '../users/profile.dart';

class ChemistryTheoryPage extends StatefulWidget {
  const ChemistryTheoryPage({super.key});

  @override
  State<ChemistryTheoryPage> createState() => _ChemistryTheoryPageState();
}

class _ChemistryTheoryPageState extends State<ChemistryTheoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8CC7FE),
      body: SafeArea(
        child: SingleChildScrollView(
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
                                  height: 45,
                                  width: 45,
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
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
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
                  "Chemistry Theory",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 30, 53),
                  ),
                ),
              ),
              const SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          'assets/images/kimia.jpg',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Text(
                          " Kimia adalah cabang ilmu pengetahuan alam yang mempelajari struktur, komposisi, sifat, reaktivitas, dan transformasi materi. Kimia mempelajari bagaimana atom dan molekul berinteraksi satu sama lain, baik dalam reaksi kimia maupun dalam membentuk berbagai jenis zat dan senyawa. Melalui pemahaman kimia, kita dapat menjelaskan fenomena seperti perubahan fase materi, reaksi kimia, kinetika reaksi, termokimia, dan banyak lagi.",
                          style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 2, 30, 53),
                        ),
                        textAlign: TextAlign.justify,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Text(
                          " Kimia memiliki peran yang sangat penting dalam kehidupan sehari-hari. Dalam bidang kesehatan, kimia membantu dalam penemuan obat-obatan dan pengembangan metode analisis untuk diagnosis penyakit. Dalam industri, kimia digunakan dalam produksi berbagai bahan dan produk, seperti bahan kimia industri, polimer, obat-obatan, dan kosmetik. Kimia juga berkontribusi dalam pemahaman tentang lingkungan, seperti dalam analisis kualitas air dan udara serta dalam pengembangan teknologi yang ramah lingkungan. Selain itu, kimia berperan penting dalam bidang pertanian, makanan, energi, dan material. Dengan mempelajari kimia, kita dapat memahami dan mengendalikan transformasi materi, yang membuka pintu bagi inovasi dan pemecahan masalah dalam berbagai aspek kehidupan manusia.",
                          style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 2, 30, 53),
                        ),
                        textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
