import 'package:flutter/material.dart';

class SubMapelPage extends StatefulWidget {
  const SubMapelPage({super.key});

  @override
  State<SubMapelPage> createState() => _SubMapelPageState();
}

class _SubMapelPageState extends State<SubMapelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8CC7FE),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 140, 199, 254),
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.task,
              color: Color.fromARGB(255, 140, 199, 254),
            ),
            label: "Course"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
              color: Color.fromARGB(255, 140, 199, 254),
            ),
            label: "My Course")
      ]),
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
                                  height: 45,
                                  width: 45,
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
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: const Color.fromARGB(255, 140, 199, 254),
                                      style: BorderStyle.solid,
                                      width: 2)),
                              child: const Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 140, 199, 254),
                                size: 30,
                              ),
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
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
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Trigonometry",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 30, 53)),
              ),
            ),
            SizedBox(
                width: 300,
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
                              "Group of Questions",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 26),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
                width: 300,
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
                              "Theory",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 26),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
                width: 300,
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
                              "Tutorial Video",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 26),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
                width: 300,
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
                              "Formula",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 26),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
