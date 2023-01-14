import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
                        child: SizedBox(
                          height: 120,
                          width: 160,
                          child: Image.asset(
                            "./asssets/images/logo.png",
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.facebookF,
                              color: Color(0xff3B5999),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.twitter,
                              color: Color(0xff03A9F4),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.medium,
                              color: Color.fromARGB(255, 31, 28, 28),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.instagram,
                              color: Color(0xffF44535),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 250,
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                elevation: 10,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xffFF451B),
                                      Color(0xffFF451B)
                                    ]),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      elevation:
                                          MaterialStateProperty.all<double>(0),
                                      overlayColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red),
                                      padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry>(
                                          const EdgeInsets.all(0)),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.transparent),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Dowload CV",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(),
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
