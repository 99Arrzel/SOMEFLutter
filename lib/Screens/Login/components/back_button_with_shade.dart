import 'package:flutter/material.dart';
import 'package:flutter_gui/constants.dart';

class BackButtonWithShade extends StatelessWidget {
  const BackButtonWithShade({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.1,
        height: size.height * 0.05,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(29)),
        child: const Align(
          alignment: Alignment.topLeft,
          child: BackButton(
            color: Colors.white,
          ),
        ));
  }
}
