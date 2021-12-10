import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gui/Screens/Welcome/components/rounded_button.dart';
import 'package:flutter_gui/Screens/Login/components/text_field_container.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gui/Screens/Login/components/back_button_with_shade.dart';
import 'package:flutter_gui/API/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

_savedToken(String token) async {
  SharedPreferences tokenUser = await SharedPreferences.getInstance();
  await tokenUser.setString('jwt', token);
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    top: size.height * 0.1,
                    child: SvgPicture.asset("assets/icons/PolloSVG.svg",
                        height: size.height * 0.3)),
                Positioned(
                    top: size.height * 0.45,
                    child: const Text(
                      "Ingresa tus datos",
                      style: TextStyle(fontSize: 20),
                    )),
                Positioned(
                    top: size.height * 0.5,
                    child: TextFieldContainer(
                      child: TextField(
                        controller: emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Ingresa tu correo",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )),
                Positioned(
                    top: size.height * 0.6,
                    child: TextFieldContainer(
                      child: TextField(
                        controller: passwordController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Ingresa tu password",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        obscureText: true,
                      ),
                    )),
                Positioned(
                    top: size.height * 0.7,
                    child: RoundedButton(
                      text: "Logear",
                      press: () {
                        logear(emailController.text, passwordController.text)
                            .then((value) => {
                                  if (value.length < 25)
                                    {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return const AlertDialog(
                                              content: Text("fallo al logear"),
                                            );
                                          }),
                                    }
                                  else
                                    {
                                      //Redirecciono a el menú principal
                                      _savedToken(value),
                                    }
                                });
                      },
                    )),
                Positioned(
                    top: size.height * 0.08,
                    left: size.height * 0.05,
                    child: const BackButtonWithShade())
              ],
            )));
  }
}
