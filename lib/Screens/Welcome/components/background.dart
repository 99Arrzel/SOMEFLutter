import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery.of(context).size; //Esto es como un height 100% y width 100%
    return SizedBox(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                top: 600,
                child: Image.asset(
                  "assets/images/flutter5786.jpg", //Imagen de  flutter, debería añadir una paja como "Made  with Flutter"
                  width: size.width * 0.5,
                )),
            Positioned(
                top: -50,
                child: Image.asset(
                  "assets/images/polloLogo.jpg", //Pollos app, según google es gratis
                  width: size.width * 0.8,
                )),
            const Positioned(top: 750, child: Text("Hecho con Flutter")),
            child,
          ],
        ));
  }
}
