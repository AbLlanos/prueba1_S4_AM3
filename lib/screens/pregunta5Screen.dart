import 'dart:convert';

import 'package:flutter/material.dart';

class Pregunta5screen extends StatelessWidget {
  const Pregunta5screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Lista de pregunta 5"),),

      body: Listar(context),

    );
  }
}


Future <List> leerListaPlatillos( context ) async{

  final jsonString =  await DefaultAssetBundle.of(context).loadString("assets/data/menu2.json");

  return json.decode(jsonString)['platillos'];

}

Widget Listar(context){
  return FutureBuilder(future: leerListaPlatillos(context), 
  builder:(context, snapshot) 
    
    {
      if(snapshot.hasData ){

        final data = snapshot.data!;

        return ListView.builder( itemCount: data.length, itemBuilder:(context, index) {
          
          final item = data[index];

          return ListTile(
            title: Center(child: Text(item['id'])),

            subtitle: Column(

              children: [
                Text('Nombre: ${item['nombre']}'),
                Text('Precio: ${item['precio']['real']}'),
                Image.network(item['imagen'], width: 200, height: 200,),
              ],

            ),

          );

        },);

    }else{
      return Text("no hay datos"); 
    }

    }
  ,);
}