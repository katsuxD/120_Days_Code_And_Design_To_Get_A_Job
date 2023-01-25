import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Animated/animated_shape_container.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Cursor/animated-circle_cursor.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Text/poppins.dart';

import '../Widgets/Buttons/gradient_button.dart';
import '../Widgets/Buttons/haptic_circle.dart';
import '../Widgets/icons/padded_icon.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1FAFF),
      body: Stack(
        //Using Stack for background animation
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 250.0, vertical: 30),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedCircleCursorMouseRegion(
                          child: SizedBox(
                            height: 120,
                            width: 160,
                            child: Image.asset(
                              "./assets/images/logo.png",
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const PaddedIcon(
                            color: Color(0xff3B5999),
                            icon: FontAwesomeIcons.facebookF,
                          ),
                          const PaddedIcon(
                            color: Color(0xff03A9F4),
                            icon: FontAwesomeIcons.twitter,
                          ),
                          const PaddedIcon(
                            color: Color.fromARGB(255, 31, 28, 28),
                            icon: FontAwesomeIcons.medium,
                          ),
                          const PaddedIcon(
                            color: Color(0xffF44535),
                            icon: FontAwesomeIcons.instagram,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          AnimatedCircleCursorMouseRegion(
                            child: GradientButton(
                              clr: const [Color(0xffFF451B), Color(0xffFF451B)],
                              height: 80,
                              width: 250,
                              overlayColor: Colors.red,
                              onpressed: () {},
                              title: "Download CV",
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Poppins(
                                text: " I'm",
                                color: const Color(0xffFF451B),
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                              Poppins(
                                text: "Đặng Gia \nKhánh",
                                color: const Color(0xff222222),
                                fontSize: 100,
                                fontWeight: FontWeight.w700,
                              ),
                              Poppins(
                                text:
                                    "A passionate software engineer, product designer with web and mobile app",
                                color: const Color(0xff888888),
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AnimatedCircleCursorMouseRegion(
                                    child: HapticCircle(
                                      btnColor: const Color(0xffFFB324),
                                      hapticColor: Colors.grey.withOpacity(0.2),
                                      radius: 10,
                                      height: 80,
                                      width: 80,
                                      iconData: FontAwesomeIcons.play,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Poppins(
                                    text: "Play Video",
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ), //left section
                      Expanded(
                        child: Stack(
                          children: [
                            const Positioned(
                              top: 30,
                              left: 100,
                              child: AnimatedShapedContainer(),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    child: SizedBox(
                                        height: 500,
                                        child: Image.asset(
                                          "./assets/images/avatar.jpg",
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ), //right section
                    ],
                  ),
                ), //Mid Section Row
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
