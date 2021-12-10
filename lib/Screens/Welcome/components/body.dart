import 'package:flutter/material.dart';
import 'package:flutter_gui/Screens/Welcome/components/background.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_gui/Screens/Welcome/components/rounded_button.dart';
import 'package:flutter_gui/Screens/Login/login_screen.dart';
import 'package:flutter_gui/Screens/Registro/registro_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery.of(context).size; //Esto es como un height 100% y width 100%
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Bienvenido a AppPollos",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30,
              backgroundColor: Colors.white),
        ),
        SizedBox(
          height: size.height * 0.0005,
        ),
        SvgPicture.asset(
          "assets/icons/PolloSVG.svg",
          height: size.height * 0.3,
        ),
        RoundedButton(
            text: "Login",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            }),
        const SizedBox(
          height: 15,
        ),
        RoundedButton(
            text: "Registrate",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Registro();
                  },
                ),
              );
            }),
      ],
    ));
  }
}
