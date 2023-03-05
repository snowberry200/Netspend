import 'package:flutter/material.dart';

import 'screens/desktop.dart';
import 'screens/mobile.dart';
import 'screens/tablet.dart';

const desktopScreenSize = 1200;
const tabletScreenSize = 700;
const mobileScreenSize = 420;

class Layout extends StatelessWidget {
  const Layout({
    Key? key,
  }) : super(key: key);

  static bool isMobile(context) =>
      MediaQuery.of(context).size.width < tabletScreenSize;
  static bool isTablet(context) =>
      MediaQuery.of(context).size.width > mobileScreenSize &&
      MediaQuery.of(context).size.width <= tabletScreenSize;
  static bool isDesktop(context) =>
      MediaQuery.of(context).size.width >= desktopScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth >= desktopScreenSize) {
        return const DesktopScreen();
      } else if (constraints.maxWidth < desktopScreenSize &&
          constraints.maxWidth >= tabletScreenSize) {
        return const TabletScreen();
      } else {
        return const MobileScreen();
      }
    });
  }
}
