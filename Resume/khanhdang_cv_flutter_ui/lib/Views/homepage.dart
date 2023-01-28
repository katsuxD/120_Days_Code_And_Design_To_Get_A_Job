import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Animated/Shape/circle_grid_shape.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Animated/Shape/circle_shape.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Animated/Shape/line_shape.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Animated/Shape/square_shape.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Animated/Shape/triangle_shape.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Animated/animated_shape_container.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Cursor/animated-circle_cursor.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Text/poppins.dart';

import '../Widgets/Animated/animated_textbox_slider.dart';
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
          const Positioned(
              top: 150,
              left: 80,
              child: CircleShape(
                radius: 10,
                strokeWidth: 1,
                lineColor: Color(0xffC9CDFF),
                strokeJoin: StrokeJoin.round,
              )),
          const Positioned(
              top: 300,
              left: 150,
              child: SquareShape(
                height: 55,
                width: 55,
                strokeWidth: 5,
                lineColor: Color(0xffDBF1CD),
              )),
          const Positioned(
              top: 500,
              left: 150,
              child: LineShape(
                width: 40,
                strokeWidth: 5,
                lineColor: Color(0xffC9CDFF),
              )),
          const Positioned(
              top: 620,
              left: 50,
              child: TriagnleShape(
                height: 30,
                width: 40,
                strokeWidth: 4,
                lineColor: Color(0xffB7BEC1),
              )),
          const Positioned(
              bottom: 120,
              left: 120,
              child: CircleGridShape(
                height: 130,
                width: 90,
                color: Color(0xffC9CDFF),
                crossAxisCount: 4,
                itemCount: 20,
                gap: 6,
              )),
          const Positioned(
              top: 730,
              left: 220,
              child: CircleShape(
                radius: 10,
                strokeWidth: 1,
                lineColor: Color.fromARGB(255, 187, 224, 25),
                strokeJoin: StrokeJoin.round,
              )),
          const Positioned(
              top: 650,
              left: 900,
              child: TriagnleShape(
                height: 33,
                width: 40,
                strokeWidth: 4,
                lineColor: Color(0xffF5C4C7),
              )),
          const Positioned(
              top: 180,
              right: 120,
              child: CircleGridShape(
                height: 130,
                width: 90,
                color: Color(0xffC9CDFF),
                crossAxisCount: 4,
                itemCount: 20,
                gap: 6,
              )),
          const Positioned(
              top: 150,
              right: 230,
              child: CircleShape(
                radius: 8,
                strokeWidth: 5,
                lineColor: Color(0xffDBF1CD),
                strokeJoin: StrokeJoin.round,
              )),
          const Positioned(
              top: 600,
              right: 50,
              child: LineShape(
                width: 40,
                strokeWidth: 5,
                lineColor: Color(0xffC9CDFF),
              )),
          const Positioned(
              top: 800,
              right: 100,
              child: SquareShape(
                height: 75,
                width: 55,
                strokeWidth: 5,
                lineColor: Color(0xffDBF1CD),
              )),
          const Positioned(
              top: 300,
              right: 50,
              child: TriagnleShape(
                height: 44,
                width: 40,
                strokeWidth: 4,
                lineColor: Color(0xffB7BEC1),
              )),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 250.0, vertical: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                clr: const [
                                  Color(0xffFF451B),
                                  Color(0xffFF451B)
                                ],
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
                                const Poppins(
                                  text: " I'm",
                                  color: Color(0xffFF451B),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                                const Poppins(
                                  text: "Đặng Gia \nKhánh",
                                  color: Color(0xff222222),
                                  fontSize: 100,
                                  fontWeight: FontWeight.w700,
                                ),
                                const Poppins(
                                  text:
                                      "A software engineer and product designer with experience in web and mobile app development, built this web using Flutter.",
                                  color: Color(0xff888888),
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
                                        hapticColor:
                                            Colors.grey.withOpacity(0.2),
                                        radius: 10,
                                        height: 80,
                                        width: 80,
                                        iconData: FontAwesomeIcons.play,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Poppins(
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
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    children: [
                      AnimatedTextboxSlider(
                        icon: FontAwesomeIcons.info,
                        title: "About Me",
                        onpressed: () {},
                        tabData: "none",
                        color: const Color(0xffff451b),
                        width: 250,
                      ),
                      AnimatedTextboxSlider(
                        icon: FontAwesomeIcons.addressBook,
                        title: "Resume",
                        onpressed: () {},
                        tabData: "none",
                        color: const Color(0xffff451b),
                        width: 250,
                      ),
                      AnimatedTextboxSlider(
                        icon: FontAwesomeIcons.thinkPeaks,
                        title: "Portfolio",
                        onpressed: () {},
                        tabData: "none",
                        color: const Color(0xffff451b),
                        width: 250,
                      ),
                      AnimatedTextboxSlider(
                        icon: FontAwesomeIcons.star,
                        title: "Testimonial",
                        onpressed: () {},
                        tabData: "none",
                        color: const Color(0xffff451b),
                        width: 250,
                      ),
                      AnimatedTextboxSlider(
                        icon: FontAwesomeIcons.gear,
                        title: "Service",
                        onpressed: () {},
                        tabData: "none",
                        color: const Color(0xffff451b),
                        width: 250,
                      ),
                      AnimatedTextboxSlider(
                        icon: FontAwesomeIcons.blog,
                        title: "Article",
                        onpressed: () {},
                        tabData: "none",
                        color: const Color(0xffff451b),
                        width: 250,
                      ),
                      AnimatedTextboxSlider(
                        icon: FontAwesomeIcons.envelope,
                        title: "Contact",
                        onpressed: () {},
                        tabData: "none",
                        color: const Color(0xffff451b),
                        width: 250,
                      ),
                    ],
                  ),
                  // const LineShape(
                  //   width: 100,
                  //   height: 100,
                  // ),
                  // const SquareShape(
                  //   width: 100,
                  //   height: 100,
                  // ),
                  // const TriagnleShape(
                  //   width: 100,
                  //   height: 100,
                  // ),
                  // const CircleGridShape(
                  //   height: 130,
                  //   width: 90,
                  //   crossAxisCount: 4,
                  //   itemCount: 20,
                  //   color: Color(0xffC9CDFF),
                  //   gap: 6,
                  // ),
                  Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
