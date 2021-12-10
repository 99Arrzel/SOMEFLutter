import 'package:flutter/material.dart';
import 'package:flutter_gui/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_gui/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
        home: WelcomeScreen());
  }
}
