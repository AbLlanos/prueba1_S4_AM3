import 'package:flutter/material.dart';

class Pregunta2screen extends StatefulWidget {
  const Pregunta2screen({super.key});

  @override
  State<Pregunta2screen> createState() => _Pregunta2screenState();
}

class _Pregunta2screenState extends State<Pregunta2screen> {
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
      appBar: AppBar(title:  Center(child: Text("Datos a Pedir:"))),
      body: formulario(context),
    );
  }
}

Widget formulario(context) {
  
  TextEditingController distancia = TextEditingController();
  TextEditingController precio = TextEditingController();
  TextEditingController eficiencia = TextEditingController();

  return Column(
    children: [
      Text(""),
      TextField(
        controller: distancia,
        decoration:  InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Ingrese Distancia del viaje (km)."),
        ),
      ),
      Text(""),
      TextField(
        controller: precio,
        decoration:  InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Precio por litro de combustible."),
        ),
      ),
      Text(""),
      TextField(
        controller: eficiencia, 
        decoration:  InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Eficiencia del auto (km/litro,)"),
        ),
      ),
      Text(""),
      OutlinedButton(
        onPressed: () => calcular(distancia, precio, eficiencia, context),
        child:  Text("El costo total "),
      ),
    ],
  );
}

void calcular(_distancia, _precio, _eficiencia, context) {

  double distancia = double.parse(_distancia.text);
  double precio = double.parse(_precio.text);
  double eficiencia = double.parse(_eficiencia.text);

  double litros =  eficiencia / distancia;
  double costoTotal = litros * precio;

  String mensaje = "";

  if (eficiencia <= 0) {
    mensaje = "Eficiencia del auto (km/litro) debe ser mayor a 0.";
  } else {
    mensaje ="El costo total es ${costoTotal}";
  }

  

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(title:  Text("respuesta"), 
      content: Text(mensaje));
    },
  );
}
