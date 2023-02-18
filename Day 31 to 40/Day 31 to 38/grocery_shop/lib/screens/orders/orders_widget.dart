
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_rauxanh_grocery_app/inner_screens/product_details.dart';
import 'package:shop_rauxanh_grocery_app/services/global_method.dart';


import '../../services/utils.dart';
import '../../widgets/text_widget.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return ListTile(
      subtitle: const Text('Paid: \$12.8'),
      onTap: () {
        GlobalMethods.navigateTo(
            ctx: context, routeName: ProductDetails.routeName);
      },
      leading:  FancyShimmerImage(
          width: size.width * 0.2,
          imageUrl: 'https://product.hstatic.net/200000053174/product/6apcs001trk01-475k__1d554222054e4ce18f3129e3927acef5_master.jpg',
          boxFit: BoxFit.fill,
        ),
      
      title: TextWidget(text: 'Title  x12', color: color, textSize: 18),
      trailing: TextWidget(text: '03/08/2022', color: color, textSize: 18),
    );
  }
}
