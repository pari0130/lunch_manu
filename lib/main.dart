import 'package:flutter/material.dart';
import 'pages/pages.dart';
import 'theme/color.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primaryColor: primary,
        // textTheme: GoogleFonts.latoTextTheme(
        //   Theme.of(context).textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        // ),
      ),
      home: RootApp()
    );
  }
}