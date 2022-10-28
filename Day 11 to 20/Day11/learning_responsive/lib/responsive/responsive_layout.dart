import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopcaffold;
  const ResponsiveLayout({
    Key? key,
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopcaffold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrais) {
        if (constrais.maxWidth < 600) {
          return mobileScaffold;
        } else if (constrais.maxWidth < 1100) {
          return tabletScaffold;
        } else {
          return desktopcaffold;
        }
      },
    );
  }
}
