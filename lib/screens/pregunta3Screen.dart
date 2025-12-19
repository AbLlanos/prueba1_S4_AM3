import 'package:flutter/material.dart';

class Pregunta3screen extends StatelessWidget {
  const Pregunta3screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Variables a pedir:"))),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img01.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: suero(context),
      ),
    );
  }
}

Widget suero(context) {
  TextEditingController volumen = TextEditingController();
  TextEditingController tiempo = TextEditingController();
  TextEditingController factorGoteo = TextEditingController();

  return Column(
    children: [
      TextField(
        controller: volumen,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Ingrese el Volumen a infundir (mL)."),
        ),
      ),
      Text(""),
      TextField(
        controller: tiempo,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Ingrese el Tiempo (horas)."),
        ),
      ),
      Text(""),
      TextField(
        controller: factorGoteo,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text(
            "Ingrese el Factor de goteo (ej: 20 gotas/mL para macrogotero).",
          ),
        ),
      ),
      Text(""),
      OutlinedButton(
        onPressed: () => calcular(volumen, tiempo, factorGoteo, context),
        child: Text("Calcular gotas/min"),
      ),
    ],
  );
}

void calcular(_volumen, _tiempo, _factorgoteo, context) {
  double volumen = double.parse(_volumen.text);   
  double tiempo = double.parse(_tiempo.text);      
  double factor = double.parse(_factorgoteo.text); 

  String mensaje = "";

  if (tiempo <= 0) {
    mensaje = "Error: el tiempo debe ser mayor a 0.";
  } else {
    double gotasMin = (volumen * factor) / (tiempo * 60);
    mensaje = "Gotas por minuto: ${gotasMin.toStringAsFixed(2)}";
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("respuesta"),
        content: Text(mensaje),
      );
    },
  );
}
