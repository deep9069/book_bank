// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:flutter/services.dart';
// import 'package:pdftron_flutter/pdftron_flutter.dart';
//
// void main() => runApp(MyAppPDF());
//
// class MyAppPDF extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyAppPDF> {
//   String _version = 'Unknown';
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//
//     PdftronFlutter.openDocument("https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf");
//   }
//
//   // Platform messages are asynchronous, so we initialize via an async method.
//   Future<void> initPlatformState() async {
//     String version;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       //PdftronFlutter.initialize('free');
//       version = await PdftronFlutter.version;
//     } on PlatformException {
//       version = 'Failed to get platform version.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _version = version;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('PDFTron flutter app'),
//         ),
//         body: Center(
//           child: Text('Running on: $_version\n'),
//         ),
//       ),
//     );
//   }
// }