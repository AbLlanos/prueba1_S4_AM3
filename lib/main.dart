
import 'package:app_prueba1_am3/screens/pregunta2Screen.dart';
import 'package:app_prueba1_am3/screens/pregunta3Screen.dart';
import 'package:app_prueba1_am3/screens/pregunta4Screen.dart';
import 'package:app_prueba1_am3/screens/pregunta5Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: Cuerpo());
  }
}

class Cuerpo extends StatelessWidget {
   const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Vista Principal"),
        actions: [
          IconButton(
            icon:  Icon(Icons.info_outline),
            onPressed: () {
              mostrarMensaje(context);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
             DrawerHeader(child: Column(children: [Text("Ejercicios")])),

            ListTile(
              title:  Text("pregunta 2"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pregunta2screen()),
                );
              },
            ),
            ListTile(
              title:  Text("pregunta 3"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pregunta3screen()),
                );
              },
            ),
            ListTile(
              title:  Text("pregunta 4"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pregunta4screen()),
                );
              },
            ),
            ListTile(
              title:  Text("pregunta 5"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pregunta5screen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void mostrarMensaje(context) {
  TextEditingController titulo = TextEditingController(
    text: 'Ejercicios de Programación',
  );
  TextEditingController programador = TextEditingController(text: 'Abner Salazar (Juan Paz)');
  TextEditingController carrera = TextEditingController(
    text: 'Desarrollo de Software',
  );

  String mensaje =
      'Título: ${titulo.text}\n'
      'Programador: ${programador.text}\n'
      'Carrera: ${carrera.text}';

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(content: Text(mensaje));
    },
  );
}
