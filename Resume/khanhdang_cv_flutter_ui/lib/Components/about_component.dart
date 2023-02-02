import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Buttons/gradient_button.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Text/poppins.dart';

import '../Widgets/Cursor/animated-circle_cursor.dart';
import '../Widgets/Misc/info_tile.dart';

class AboutComponent extends StatefulWidget {
  const AboutComponent({super.key});

  @override
  State<AboutComponent> createState() => _AboutComponentState();
}

class _AboutComponentState extends State<AboutComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: double.infinity,
      padding: const EdgeInsets.all(80),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              spreadRadius: 10,
              blurRadius: 20)
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    height: 650,
                    width: 400,
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset("./assets/images/avatar3.jpg")),
                  ),
                  Positioned(
                      top: 80,
                      right: 50,
                      child: Container(
                        height: 450,
                        width: 300,
                        padding: const EdgeInsets.all(40),
                        decoration: const BoxDecoration(
                          color: Color(0xffFF451B),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: const [
                            InfoTile(
                              title: "Name",
                              subTitle: "Đặng Gia Khánh",
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InfoTile(
                              title: "Mail",
                              subTitle: "khanhdangcv2021@gmail.com",
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InfoTile(
                              title: "Phone",
                              subTitle: "+84 985771764",
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InfoTile(
                              title: "Address",
                              subTitle: "Binh Tan, Ho Chi Minh",
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Poppins(
                    text: "About Me",
                    fontSize: 25,
                    color: Color(0xffFF451B),
                    fontWeight: FontWeight.w600,
                  ),
                  Poppins(
                    text:
                        "Just an ordinary guy trying to find what the world is",
                    fontSize: 34,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(height: 20),
                  Poppins(
                    text:
                        "A passionate software engineer, huge love with web and mobile product",
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  Poppins(
                    text:
                        "As a software engineer, having a good background,As a software engineer, having a good background, As a software engineer, having a good background, As a software engineer, having a good background, As a software engineer, having a good background, ",
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AnimatedCircleCursorMouseRegion(
                    child: GradientButton(
                      title: "Download CV",
                      clr: [
                        Color(0xffFF451B),
                        Color(0xffFF451B),
                      ],
                      height: 65,
                      width: 250,
                      overlayColor: Colors.red,
                      padding: const EdgeInsets.all(0),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
