import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../users/login.dart';
import '../users/profile.dart';
import 'package:video_player/video_player.dart';
import 'package:sipintar/global.dart' as global;

class PhysicsVideoPage extends StatefulWidget {
  const PhysicsVideoPage({Key? key}) : super(key: key);

  @override
  State<PhysicsVideoPage> createState() => _PhysicsVideoPageState();
}

class _PhysicsVideoPageState extends State<PhysicsVideoPage> {
  late VideoPlayerController _controller;
  double _sliderValue = 0.0;
  late double width;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/physics.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(() {
      setState(() {
        _sliderValue = _controller.value.position.inSeconds.toDouble();
      });
    });
    if (global.username.length <= 9) {
      width = 160.0;
    } else if (global.username.length <= 13) {
      width = 190.0;
    } else if (global.username.length <= 20) {
      width = 230.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void seekToSeconds(double seconds) {
    Duration newDuration = Duration(seconds: seconds.toInt());
    _controller.seekTo(newDuration);
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
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                                                    color: Color(0xFF22355C)),
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
                                                    color: Color(0xFF22355C)),
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
                "Physics Tutorial Video",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 30, 53),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Center(
                    child: _controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${formatDuration(_controller.value.position)} / ${formatDuration(_controller.value.duration)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (_controller.value.isInitialized)
                    Positioned(
                      bottom: 15,
                      left: 55,
                      right: 0,
                      child: Slider(
                        value: _sliderValue,
                        min: 0.0,
                        max: _controller.value.duration.inSeconds.toDouble(),
                        onChanged: (newValue) {
                          setState(() {
                            _sliderValue = newValue;
                          });
                        },
                        onChangeEnd: (newValue) {
                          seekToSeconds(newValue);
                        },
                      ),
                    ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                        child: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
