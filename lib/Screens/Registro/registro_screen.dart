import 'package:flutter/material.dart';
import 'package:flutter_gui/Screens/Login/components/text_field_container.dart';
import 'package:flutter_gui/Screens/Login/login_screen.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter_gui/constants.dart';
import 'package:flutter_gui/API/api.dart';

//Esto debería traerlo desde la db? creo que sí
String _dropDownValue = 'La Paz';
var _ciudades = [
  'La Paz',
  'Cochabamba',
  'Santa Cruz',
  'Oruro',
  'Potosi',
  'Tarija',
  'Chuquisaca',
  'Beni',
  'Pando'
];

TextEditingController usuario = TextEditingController();
TextEditingController correo = TextEditingController();
TextEditingController nombre = TextEditingController();
TextEditingController apellido = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController rpassword = TextEditingController();

void _validar(context) {
  //Min password lenght validation
  if (usuario.text.length < 6) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content:
            const Text('Por favor ingrese un usuario con 6 o más caracteres'),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
    return;
  }
  if (password.text.length < 7) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content:
            const Text('Por favor ingrese una contraseña con 7 o más digitos'),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
    return;
  }

  if (password.text.isEmpty) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('Por favor ingrese su contraseña'),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
    return;
  }
  if (_dropDownValue == '') {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('Por favor ingrese su ciudad'),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
    return;
  }

  if (rpassword.text != password.text) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("Error"),
              content: const Text("Las passwords no son iguales"),
              actions: <Widget>[
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
    return;
  }
  if (apellido.text.isEmpty) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("Error"),
              content: const Text("El apellido no puede estar vacio"),
              actions: <Widget>[
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
    return;
  }

  if (nombre.text.isEmpty) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("Error"),
              content: const Text("El nombre no puede estar vacio"),
              actions: <Widget>[
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
    return;
  }
  //Validate a email
  if (correo.text.isEmpty) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("Error"),
              // ignore: prefer_const_constructors
              content: Text("El correo no puede estar vacio"),
              actions: <Widget>[
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
    return;
  } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(correo.text)) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("Error"),
              content: const Text("El correo no es valido"),
              actions: <Widget>[
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
    return;
  }
  //if date is not selected
  if (fechaNacimiento.selectedDate.toString() == 'null') {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("Error"),
              content: Text("Debes seleccionar una fecha de nacimiento" +
                  fechaNacimiento.selectedDate.toString()),
              actions: <Widget>[
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
    return;
  }
}

DateRangePickerController fechaNacimiento = DateRangePickerController();

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //Make a register with email, name, lastname, nick, password, confirm password, date of birth, and city
    return Scaffold(
        body: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    top: size.height * 0.08,
                    child: const Text("Registrate y califica! ",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                Positioned(
                    top: size.height * 0.12,
                    child: TextFieldContainer(
                        child: TextField(
                      controller: correo,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Ingresa tu correo",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ))),
                Positioned(
                    top: size.height * 0.18,
                    child: TextFieldContainer(
                        child: TextField(
                      controller: usuario,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Ingresa tu nick",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ))),
                Positioned(
                    top: size.height * 0.24,
                    child: TextFieldContainer(
                        child: TextField(
                      controller: nombre,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Ingresa tu nombre",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ))),
                Positioned(
                    top: size.height * 0.30,
                    child: TextFieldContainer(
                        child: TextField(
                      controller: apellido,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Ingresa tu apellido",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ))),
                Positioned(
                    top: size.height * 0.36,
                    child: TextFieldContainer(
                        child: TextField(
                      controller: password,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Ingresa tu password",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      obscureText: true,
                    ))),
                Positioned(
                    top: size.height * 0.42,
                    child: TextFieldContainer(
                        child: TextField(
                      controller: rpassword,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Repite tu password",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      obscureText: true,
                    ))),
                Positioned(
                    top: size.height * 0.48,
                    child: DropdownButton(
                      value: _dropDownValue,
                      items: _ciudades.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _dropDownValue = value.toString();
                        });
                      },
                      hint: const Text("Selecciona tu ciudad",
                          style: TextStyle(color: Colors.black)),
                    )),
                Positioned(
                    top: size.height * 0.55,
                    child: const Text("Elige tu fecha de nacimiento")),
                Positioned(
                    top: size.height * 0.59,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: size.width * 0.8,
                      height: size.height * 0.3,
                      child: SfDateRangePicker(
                          controller: fechaNacimiento,
                          view: DateRangePickerView.year,
                          maxDate: DateTime.now()
                              .subtract(const Duration(days: 365 * 18)),
                          selectionMode: DateRangePickerSelectionMode.single),
                    )),
                Positioned(
                    top: size.height * 0.9,
                    left: size.width * 0.8,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: size.width * 0.15,
                      height: size.height * 0.075,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(29)),
                      child: TextButton(
                        onPressed: () {
                          _validar(context);
                          registrar(
                            nombre.text,
                            apellido.text,
                            password.text,
                            usuario.text,
                            fechaNacimiento.selectedDate.toString(),
                            correo.text,
                            _dropDownValue,
                          ).then((value) => {
                                if ((value) == true)
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen())),
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const AlertDialog(
                                            content: Text(
                                                "Cuenta creada correctamente 👍😎, ahora logea con tus datos."),
                                          );
                                        }),
                                  }
                                else
                                  {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const AlertDialog(
                                            content: Text(
                                                "fallo al crear tu usuario 😢"),
                                          );
                                        }),
                                  }
                              });
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ],
            )));
  }
}
