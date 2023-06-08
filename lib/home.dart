// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';
import 'users/login.dart';
import 'mapel/it.dart';
import 'mapel/science.dart';
import 'mapel/math.dart';
import 'users/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<String> img = ['event.jpg', 'even.jpeg', 'event3.jpg'];
  int index = 0;

  Widget homeScreen(context) {
    return SafeArea(
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
                                    image: AssetImage(
                                        "assets/images/SiPintar.png"),
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
                                    fontWeight: FontWeight.bold),
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
                                    color: const Color.fromARGB(
                                        255, 140, 199, 254),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 140, 199, 254),
                                        width: 2)),
                                child: GestureDetector(
                                    onTapDown: (detail) {
                                      showMenu(
                                          context: context,
                                          position: const RelativeRect.fromLTRB(
                                              75.0, 75.0, 0.0, 0.0),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
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
                                                            EdgeInsets.only(
                                                                left: 10.0),
                                                        child: Text(
                                                          'Profile',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF22355C)),
                                                        ))
                                                  ],
                                                )),
                                            PopupMenuItem(
                                                value: 'logout',
                                                onTap: () =>
                                                    Get.to(const LoginPage()),
                                                child: Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.logout,
                                                      color: Color(0xFF22355C),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10.0),
                                                        child: Text(
                                                          'Logout',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF22355C)),
                                                        ))
                                                  ],
                                                ))
                                          ]);
                                    },
                                    child: Row(
                                      children: const [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.0, right: 10.0),
                                            child: Text(
                                              'Hai, user!',
                                              style: TextStyle(
                                                  color: Color(0xFF22355C),
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Icon(
                                          Icons.person,
                                          color: Color(0xFF22355C),
                                          size: 30,
                                        ),
                                      ],
                                    )),
                              ))
                        ],
                      )),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F7),
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        cursorHeight: 20,
                        autofocus: false,
                        decoration: InputDecoration(
                            hintText: "Search",
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          CarouselSlider(
            items: img.map((i) {
              return Container(
                margin: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    // ignore: unnecessary_brace_in_string_interps
                    'assets/images/${i}',
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.all(0),
            child: Text(
              "News",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF22355C)),
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 3, // Jumlah tab
              child: Column(
                children: [
                  const TabBar(
                    labelColor: Color(0xFF22355C),
                    tabs: [
                      Tab(text: 'Math'),
                      Tab(text: 'Science'),
                      Tab(text: 'IT')
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Konten untuk Tab 1
                        // ignore: avoid_unnecessary_containers
                        Container(
                            child: ListView(children: [
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 26, 33, 27),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/event.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "16 Fakta Unik tentang Matematika Ini Bikin Kamu Senyum-senyum Dikulum",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://www.kalderanews.com/2020/07/16-fakta-unik-tentang-matematika-ini-bikin-kamu-senyum-senyum-dikulum/';
                              // if (!await launchUrl(Uri.parse(url))) {
                              //   throw 'Could not launch $url';
                              // }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 26, 33, 27),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/event2.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "Cerita unik tentang matematika (fakta matematika)",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://www.utakatikotak.com/Fakta-Unik-Matematika-Bikin-Mikir-Panjang/kongkow/detail/15568';
                              // if (!await launchUrl(Uri.parse(url))) {
                              //   throw 'Could not launch $url';
                              // }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 26, 33, 27),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/even.jpeg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "Apa yang unik tentang matematika yang mayoritas orang tidak tahu?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://www.utakatikotak.com/Fakta-Unik-Matematika-Bikin-Mikir-Panjang/kongkow/detail/15568';
                              // if (!await launchUrl(Uri.parse(url))) {
                              //   throw 'Could not launch $url';
                              // }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 26, 33, 27),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/sains2.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "Fakta Unik dan Keajaiban Tentang Matematika",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://www.utakatikotak.com/Fakta-Unik-Matematika-Bikin-Mikir-Panjang/kongkow/detail/15568';
                              // if (!await launchUrl(Uri.parse(url))) {
                              //   throw 'Could not launch $url';
                              // }
                            },
                          ),
                        ])),
                        // Konten untuk Tab 2
                        Container(
                            child: ListView(children: [
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 26, 33, 27),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/sains3.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "6 Fakta Sains yang Harus Kamu Ketahui Sekali Seumur Hidup",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://www.kalderanews.com/2020/07/16-fakta-unik-tentang-matematika-ini-bikin-kamu-senyum-senyum-dikulum/';
                              // if (!await launchUrl(Uri.parse(url))) {
                              //   throw 'Could not launch $url';
                              // }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 26, 33, 27),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/sains2.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "Fakta-Fakta Unik Sains yang Belum Banyak Diketahui, Penasaran? Yuk Cek Sekarang",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://www.utakatikotak.com/Fakta-Unik-Matematika-Bikin-Mikir-Panjang/kongkow/detail/15568';
                              // if (!await launchUrl(Uri.parse(url))) {
                              //   throw 'Could not launch $url';
                              // }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 26, 33, 27),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/sains1.jpeg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "17 Fakta Unik Sains yang Mungkin Belum Anda Ketahui?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://www.utakatikotak.com/Fakta-Unik-Matematika-Bikin-Mikir-Panjang/kongkow/detail/15568';
                              // if (!await launchUrl(Uri.parse(url))) {
                              //   throw 'Could not launch $url';
                              // }
                            },
                          ),
                        ])),
                        // Konten untuk Tab 3
                        Container(
                            child: ListView(children: [
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 26, 33, 27),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/sosial1.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "Inilah 5 Fakta Menarik Seputar Dunia Teknologi yang Wajib Kalian Ketahui",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://www.kalderanews.com/2020/07/16-fakta-unik-tentang-matematika-ini-bikin-kamu-senyum-senyum-dikulum/';
                              // if (!await launchUrl(Uri.parse(url))) {
                              //   throw 'Could not launch $url';
                              // }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 26, 33, 27),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/sains2.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "Fakta-Fakta Unik Sains yang Belum Banyak Diketahui, Penasaran? Yuk Cek Sekarang",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://www.utakatikotak.com/Fakta-Unik-Matematika-Bikin-Mikir-Panjang/kongkow/detail/15568';
                              // if (!await launchUrl(Uri.parse(url))) {
                              //   throw 'Could not launch $url';
                              // }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 26, 33, 27),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/sains1.jpeg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "17 Fakta Unik Sains yang Mungkin Belum Anda Ketahui?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://www.utakatikotak.com/Fakta-Unik-Matematika-Bikin-Mikir-Panjang/kongkow/detail/15568';
                              // if (!await launchUrl(Uri.parse(url))) {
                              //   throw 'Could not launch $url';
                              // }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 26, 33, 27),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/sains1.jpeg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "17 Fakta Unik Sains yang Mungkin Belum Anda Ketahui?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://www.utakatikotak.com/Fakta-Unik-Matematika-Bikin-Mikir-Panjang/kongkow/detail/15568';
                              // if (!await launchUrl(Uri.parse(url))) {
                              //   throw 'Could not launch $url';
                              // }
                            },
                          ),
                        ])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF8CC7FE), body: homeScreen(context));
  }
}
