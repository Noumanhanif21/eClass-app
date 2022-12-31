import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../utlis/theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    controller.addListener(() {
      if (controller.value > 0.7) {
        controller.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        backgroundColor: MyColors.bgColor.withOpacity(0.7),
        appBar: AppBar(
          title: Center(
            child: Text(
              "Hi Student",
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w700,
                color: MyColors.whiteColor,
              ),
            ),
          ),
          backgroundColor: MyColors.bgColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.lightbulb,
                color: MyColors.dullWhite,
              ),
            ),
          ],
        ),
        body: Center(
          child: SizedBox(
            height: s.height,
            width: s.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 70,
                        child: Center(
                          child: Lottie.asset(
                              "lib/assets/lotties/avatar_lottie.json",
                              fit: BoxFit.cover,
                              controller: controller, onLoaded: (c) {
                            controller.duration = c.duration;
                            controller.forward();
                          }, reverse: true),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Hi, nouman!",
                            style: GoogleFonts.openSans(
                              color: MyColors.textColorlight,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Welcome back to school",
                            style: GoogleFonts.pacifico(
                              color: Colors.lightBlue,
                              fontSize: 12,
                              //fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (() {}),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.purpleAccent, Colors.purple]),
                        ),
                        height: 200,
                        width: s.width * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: Center(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 50,
                                    child: Lottie.asset(
                                      "lib/assets/lotties/attend_lottie.json",
                                      repeat: true,
                                      // controller: controller,
                                      // onLoaded: (c) {
                                      //   controller.duration = c.duration;
                                      //   controller.forward();
                                      // },
                                    ),
                                  ),
                                  Text(
                                    "Attendance",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (() {}),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.lightGreenAccent,
                                Colors.lightGreen
                              ]),
                        ),
                        height: 200,
                        width: s.width * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: Center(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 50,
                                    child: Lottie.asset(
                                      "lib/assets/lotties/result_lottie.json",
                                      repeat: true,
                                      reverse: true,
                                    ),
                                  ),
                                  Text(
                                    "Results",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // SizedBox(
                //   height: 40,
                // ),
                GestureDetector(
                  onTap: (() {}),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.yellow, Colors.orange]),
                    ),
                    height: 150,
                    width: s.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.transparent,
                                child: Lottie.asset(
                                  "lib/assets/lotties/class_lottie.json",
                                  fit: BoxFit.cover,
                                  repeat: true,
                                  reverse: true,
                                ),
                              ),
                              Text(
                                "Classes",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
