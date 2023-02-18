// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_rauxanh_grocery_app/consts/theme_data.dart';
import 'package:shop_rauxanh_grocery_app/inner_screens/feed_screen.dart';
import 'package:shop_rauxanh_grocery_app/inner_screens/on_sale_screen.dart';
import 'package:shop_rauxanh_grocery_app/inner_screens/product_details.dart';
import 'package:shop_rauxanh_grocery_app/provider/dark_theme_provider.dart';
import 'package:shop_rauxanh_grocery_app/screens/btm_bar.dart';
import 'package:shop_rauxanh_grocery_app/screens/orders/orders_screen.dart';
import 'package:shop_rauxanh_grocery_app/screens/viewed_recently/viewed_recently.dart';
import 'package:shop_rauxanh_grocery_app/screens/wishlist/wishlist_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    getCurrentAppTheme();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, themeProvider, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const BottomBarScreen(),
            routes: {
              OnSaleScreen.routeName: (context) => const OnSaleScreen(),
              FeedsScreens.routeName: (context) => const FeedsScreens(),
              ProductDetails.routeName: (context) => const ProductDetails(),
              WishlistScreen.routeName: (context) => const WishlistScreen(),
              OrdersScreen.routeName: (context) => const OrdersScreen(),
              ViewedRecentlyScreen.routeName: (context) =>
                  const ViewedRecentlyScreen(),
            },
          );
        },
      ),
    );
  }
}
