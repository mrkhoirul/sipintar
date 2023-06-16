import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'users/login.dart';
import 'users/profile.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<String> img = ['event.jpg', 'even.jpeg', 'event3.jpg'];
  int index = 0;

  late double width;

  @override
  void initState() {
    super.initState();
    if (widget.username.length <= 9) {
      width = 160.0;
    } else if (widget.username.length <= 13) {
      width = 190.0;
    } else if (widget.username.length <= 20) {
      width = 230.0;
    }
  }

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
                                width: width,
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
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 10.0),
                                            child: Text(
                                              'Hai, ${widget.username}!',
                                              style: const TextStyle(
                                                  color: Color(0xFF22355C),
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        const Icon(
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
                              "Kunci Jawaban Matematika Kelas 7 Semester 2 Uji Kompetensi 7 Halaman 178 179 180: Uraian",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://bali.tribunnews.com/2023/06/15/kunci-jawaban-matematika-kelas-7-semester-2-uji-kompetensi-7-halaman-178-179-180-uraian';
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
                        ListView(children: [
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 26, 33, 27),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/sains4.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "11 Fakta Menakjubkan tentang Sains buat kamu tercengang",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://edukasi.okezone.com/read/2022/01/24/623/2536939/11-fakta-menakjubkan-tentang-sains';
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
                                        AssetImage('assets/images/sains1.jpg'),
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
                                  'https://peristiwa.info/10613/fakta-fakta-unik-sains-yang-belum-banyak-diketahui-penasaran-yuk-cek-sekarang/';
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
                                        AssetImage('assets/images/sains3.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "10 Fakta Sains tentang Otak Manusia, Kamu Sudah Tahu?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://www.detik.com/edu/detikpedia/d-6538792/10-fakta-sains-tentang-otak-manusia-kamu-sudah-tahu';
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
                                        AssetImage('assets/images/sains5.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "9 Fakta Unik Dunia Sains Yang Lucu Dan Mengagetkan. Benarkah Unicorn Itu Nyata?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://berita.99.co/fakta-unik-dunia-sains/';
                              // if (!await launchUrl(Uri.parse(url))) {
                              //   throw 'Could not launch $url';
                              // }
                            },
                          ),
                        ]),
                        // Konten untuk Tab 3
                        ListView(children: [
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 26, 33, 27),
                                image: DecorationImage(
                                    image: AssetImage('assets/images/it1.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "Chat GPT, Berkah Atau Musibah?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://bbpmpjateng.kemdikbud.go.id/chat-gpt-berkah-atau-musibah/';
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
                                    image: AssetImage('assets/images/it2.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "Menjanjikan! Ini Fakta Prospek Karir Bidang IT dan Telekomunikasi",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://toghr.com/it-dan-telekomunikasi/';
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
                                    image: AssetImage('assets/images/it3.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "5 Fakta Perkembangan IT di Indonesia, Tertarik Bekerja di Bidang Ini?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://www.idntimes.com/life/career/muhammad-tarmizi-murdianto/fakta-perkembangan-it-di-indonesia';
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
                                    image: AssetImage('assets/images/it4.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            autofocus: true,
                            subtitle: const Text(
                              "Apa Aja Sih Plus Minus Kerja di bidang IT?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () async {
                              const url =
                                  'https://blog.klob.id/2022/06/17/apa-aja-sih-plus-minus-kerja-di-bidang-it/';
                              // if (!await launchUrl(Uri.parse(url))) {
                              //   throw 'Could not launch $url';
                              // }
                            },
                          ),
                        ]),
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
