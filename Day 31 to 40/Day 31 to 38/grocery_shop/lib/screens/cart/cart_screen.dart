import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_rauxanh_grocery_app/screens/cart/cart_widget.dart';
import 'package:shop_rauxanh_grocery_app/services/utils.dart';
import 'package:shop_rauxanh_grocery_app/widgets/text_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          color: color,
          text: "Cart (2)",
          isTitle: true,
          textSize: 22,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyLight.delete,
              color: color,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _checkout(ctx: context),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CartWidget();
                }),
          ),
        ],
      ),
    );
  }

  Widget _checkout({required BuildContext ctx}) {
    final Color color = Utils(ctx).color;
    Size size = Utils(ctx).getScreenSize;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: size.height * 0.1,
          child: Row(
            children: [
              Material(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                      color: Colors.white,
                      text: "Đặt hàng ngay",
                      textSize: 20,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              FittedBox(
                child: TextWidget(
                  text: "Tổng tiền: \$0.192",
                  color: color,
                  textSize: 18,
                  isTitle: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
