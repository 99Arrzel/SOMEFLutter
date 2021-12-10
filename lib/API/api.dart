import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> logear(String correo, String password) async {
  try {
    final response =
        await http.post(Uri.parse('http://10.0.2.2:3000/api/usuarios/login'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(
              <String, String>{'correo': correo, 'password': password},
            ));
    if (response.statusCode == 200) {
      Map<String, dynamic> token = jsonDecode(response.body);
      return (token['token']);
    } else {
      return "Fallo al logear";
    }
  } catch (err) {
    return "Error de conexión";
  }
}

Future<bool> registrar(
    String nombre,
    String apellido,
    String password,
    String usuario,
    // ignore: non_constant_identifier_names
    String fecha_nacimiento,
    String correo,
    String ciudad) async {
  //Porque bool? porque simplemente quiero saber si se pudo o no
  try {
    final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/api/usuarios/crearUsuario'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'nombre': nombre,
            'apellido': apellido,
            'password': password,
            'usuario': usuario,
            'fecha_nacimiento': fecha_nacimiento,
            'correo': correo,
            'ciudad': ciudad
          },
        ));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } catch (err) {
    return false;
  }
}
