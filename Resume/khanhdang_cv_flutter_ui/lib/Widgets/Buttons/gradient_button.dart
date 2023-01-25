import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final List<Color> clr;
  final Color overlayColor;
  final Function() onpressed;
  final double width;
  final double height;
  final double? roundness;
  final EdgeInsets? padding;
  const GradientButton({
    Key? key,
    required this.title,
    required this.clr,
    required this.overlayColor,
    required this.onpressed,
    required this.width,
    required this.height,
    this.roundness,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(10.0),
        child: Card(
          elevation: 10,
          child: Container(
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                  //colors: [Color(0xffFF451B), Color(0xffFF451B)]),
                  colors: clr,),
              borderRadius:  BorderRadius.all(
                Radius.circular(roundness ?? 5),
              ),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                overlayColor: MaterialStateProperty.all<Color>(overlayColor),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(0)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              onPressed: onpressed,
              child: Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
 