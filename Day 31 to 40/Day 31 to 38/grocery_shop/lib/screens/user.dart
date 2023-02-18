import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shop_rauxanh_grocery_app/provider/dark_theme_provider.dart';
import 'package:shop_rauxanh_grocery_app/screens/orders/orders_screen.dart';
import 'package:shop_rauxanh_grocery_app/screens/viewed_recently/viewed_recently.dart';
import 'package:shop_rauxanh_grocery_app/screens/wishlist/wishlist_screen.dart';
import 'package:shop_rauxanh_grocery_app/services/global_method.dart';
import 'package:shop_rauxanh_grocery_app/widgets/text_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final themState = Provider.of<DarkThemeProvider>(context);
    final Color color = themState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  text: "Hi,   ",
                  style: const TextStyle(
                    color: Colors.cyan,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: "MyName",
                        style: TextStyle(
                          color: color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              TextWidget(
                color: color,
                text: "khanhadmin@gmail.com",
                textSize: 18,
                isTitle: false,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              _listTiles(
                title: "Address",
                icon: IconlyBold.profile,
                onPressed: () async {
                  await _showAddressdialog();
                },
                // subtitle: "53/127 number 4",
                color: color,
              ),
              _listTiles(
                title: "Orders",
                icon: IconlyBold.bag,
                onPressed: () {
                  GlobalMethods.navigateTo(
                      ctx: context, routeName: OrdersScreen.routeName);
                },
                color: color,
              ),
              _listTiles(
                title: "WishList",
                icon: IconlyBold.heart,
                onPressed: () {
                  GlobalMethods.navigateTo(
                      ctx: context, routeName: WishlistScreen.routeName);
                },
                color: color,
              ),
              _listTiles(
                title: "Viewed",
                icon: IconlyBold.show,
                onPressed: () {
                  GlobalMethods.navigateTo(
                      ctx: context, routeName: ViewedRecentlyScreen.routeName);
                },
                color: color,
              ),
              _listTiles(
                title: "Forget password",
                icon: IconlyBold.unlock,
                onPressed: () {},
                color: color,
              ),
              SwitchListTile(
                title: TextWidget(
                  color: color,
                  text: themState.getDarkTheme
                      ? "Dark mode baby"
                      : "Light mode nah",
                  textSize: 22,
                  isTitle: true,
                ),
                secondary: Icon(
                  themState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : IconlyBold.swap,
                ),
                onChanged: (bool value) {
                  themState.setDarkTheme = value;
                },
                value: themState.getDarkTheme,
              ),
              _listTiles(
                title: "Logout",
                icon: IconlyBold.logout,
                onPressed: () async {
                  await _showLogoutdialog();
                },
                color: color,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showAddressdialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Update info"),
            content: TextField(
              onChanged: (value) {
                // _addressTextController.text;
              },
              controller: _addressTextController,
              maxLength: 5,
              decoration: const InputDecoration(
                hintText: "Your address",
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text("Update"),
              )
            ],
          );
        });
  }

  Future<void> _showLogoutdialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(children: [
              Image.asset(
                'assets/images/warning-sign.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text("Sign-out"),
            ]),
            content: const Text("Do you want to Sign out?"),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  color: Colors.cyan,
                  text: "Cancel",
                  textSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: TextWidget(
                  color: Colors.red,
                  text: "OK",
                  textSize: 18,
                ),
              ),
            ],
          );
        });
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        color: color,
        text: title,
        textSize: 22,
        isTitle: true,
      ),
      // subtitle: TextWidget(
      //   color: color,
      //   text: subtitle ?? "",
      //   textSize: 18,
      // ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrow_right_2),
      onTap: () {
        onPressed();
      },
    );
  }
}
