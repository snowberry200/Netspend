import 'package:flutter/widgets.dart';

import '../../layout.dart';
import 'desktop_homepage.dart';
import 'mobile_homepage.dart';
import 'tablet_homepage.dart';

class LayoutHomepage extends StatefulWidget {
  const LayoutHomepage({Key? key}) : super(key: key);

  @override
  State<LayoutHomepage> createState() => _LayoutHomepageState();
}

class _LayoutHomepageState extends State<LayoutHomepage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth >= desktopScreenSize) {
        return const DesktopHomepage();
      } else if (constraints.maxWidth < desktopScreenSize &&
          constraints.maxWidth >= tabletScreenSize) {
        return const TabletHomepage();
      } else if (constraints.maxWidth < tabletScreenSize &&
          constraints.maxWidth <= mobileScreenSize) {
        return const MobileHomepage();
      } else {
        return const MobileHomepage();
      }
    }));
  }
}
