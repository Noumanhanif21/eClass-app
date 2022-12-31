import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fyp_one/frontend/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../utlis/theme/colors.dart';
import '../utlis/widgets/get_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginScreen> {
  bool isLoading = false;
  bool loginPage = true;
  String errorMsg = '';
  final _rollController = TextEditingController(text: '');

  final _passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: MyColors.bgColor),
        backgroundColor: MyColors.bgColor,
        elevation: 0.5,
        title: Text(
          "  Welcome to eClass!",
          style: GoogleFonts.openSans(
            color: MyColors.whiteColor,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: MyColors.bgColor.withOpacity(0.4),
      body: Center(
        child: SingleChildScrollView(
          child: isLoading
              ? Center(
                  child: SpinKitDoubleBounce(
                    color: MyColors.blueColor,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                            color: MyColors.bgColor),
                        height: s.height * 0.4,
                        width: s.width * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Lottie.asset(
                                "lib/assets/lotties/login_lottie.json",
                                reverse: true,
                                repeat: true),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: getTextFeild(
                        s,
                        "Roll Number",
                        _rollController,
                        ((v) {}),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: getTextFeild(
                        s,
                        "password",
                        _passwordController,
                        ((v) {}),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: MaterialButton(
                            textColor: MyColors.textColorlight,
                            height: 50,
                            minWidth: s.width * 0.6,
                            color: MyColors.blueColor,
                            child: Text(
                              "Login",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () async {
                              Navigator.pushAndRemoveUntil(context,
                                  CupertinoPageRoute(builder: (context) {
                                return HomeScreen();
                              }), (route) => false);

                              String rollno = _rollController.text;
                              String pass = _passwordController.text;

                              if (rollno == '' ||
                                  pass == '' ||
                                  rollno.isEmpty ||
                                  pass.isEmpty) {
                              } else {
                                setState(() {
                                  isLoading = true;
                                });
                              }
                            }),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
