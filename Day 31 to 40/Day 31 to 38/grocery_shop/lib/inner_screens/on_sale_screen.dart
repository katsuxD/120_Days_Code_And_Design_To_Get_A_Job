// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_rauxanh_grocery_app/services/utils.dart';
import 'package:shop_rauxanh_grocery_app/widgets/on_sale_widget.dart';
import 'package:shop_rauxanh_grocery_app/widgets/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
  const OnSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isEmpty = false;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrow_left_2,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: "Products on sale",
          color: color,
          textSize: 24.0,
          isTitle: true,
        ),
      ),
      body: _isEmpty
          ? Center(
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/box.png",
                    ),
                  ),
                  Text(
                    "No product on sale yet!, \n Stay tuned",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ))
          : GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              //crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.45),
              children: List.generate(4, (index) {
                return OnSaleWidget();
              }),
            ),
    );
  }
}
