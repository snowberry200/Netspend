import 'package:firebase_core/firebase_core.dart';
import 'package:netspend/layout.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      DevicePreview(
      enabled: true,
      builder: (context) =>
       MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          home: const Netspend())));
}

class Netspend extends StatefulWidget {
  const Netspend({Key? key}) : super(key: key);

  @override
  State<Netspend> createState() => _NetspendState();
}

class _NetspendState extends State<Netspend> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Layout());
  }
}