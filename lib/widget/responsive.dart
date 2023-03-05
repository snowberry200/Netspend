// import 'package:flutter/cupertino.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:netspend/screens/desktop.dart';

// import '../screens/mobile.dart';
// import '../screens/tablet.dart';

// const desktopScreenSize = 1200;
// const tabletScreenSize = 700;
// const mobileScreenSize = 360;

// class Responsiveness extends StatelessWidget {
  
//   final Widget desktop, tablet, mobile;
//   const Responsiveness({Key? key, required this.desktop, required this.tablet, required this.mobile}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //double _width=MediaQuery.of(context).size.width;
//     return LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//       if (constraints.maxWidth >= desktopScreenSize) {
//         return  desktop;
//       } else if (constraints.maxWidth < desktopScreenSize && constraints.maxWidth >= tabletScreenSize) {
//         return  tablet;
//       } else {
//         return  mobile;
//       }
//     });
//   }
// }
