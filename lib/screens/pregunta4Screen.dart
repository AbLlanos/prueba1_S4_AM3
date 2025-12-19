import 'package:flutter/material.dart';

class Pregunta4screen extends StatelessWidget {
   const Pregunta4screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Cuerpo());
  }
}

class Cuerpo extends StatelessWidget {
   Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Datos a pedir:"))),
      body: suero(context),
    );
  }
}

Widget suero(BuildContext context) {
  TextEditingController peso = TextEditingController();
  TextEditingController ejercicio = TextEditingController();

  return Column(
    children: [
      TextField(
        controller: peso,
        decoration:  InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Ingrese su Peso (en kilogramos)"),
        ),
      ),
      Text(""),
      TextField(
        controller: ejercicio,
        decoration:  InputDecoration(
          border: OutlineInputBorder(),
          label: Text("¿Haces ejercicio regularmente? (Si / No)"),
        ),
      ),
      Text(""),

      OutlinedButton(
        onPressed: () => calcular(peso, ejercicio, context),
        child:  Text("Calcular gramos de proteína a consumir"),
      ),
    ],
  );
}

void calcular(_peso, _ejercicio, context) {
  double peso = double.parse(_peso.text);
  String ejercicio = (_ejercicio.text);
  double proteina = 0;

  String mensaje = "";

  if (ejercicio.toLowerCase() == "si") {
    proteina = peso * 1.6;
  } else {
    proteina = peso * 0.8;
  }

  mensaje = "DEbe consumir los siguiente egramos de proteína: ${proteina}";

  showDialog(
    context: context,
    builder: (context) {

      return AlertDialog(
        title:  Text("respuesta"),
        content: Text(mensaje),
      );
    },
    
  );
}
