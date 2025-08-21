import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  FullScreenLoader({super.key});

  final List<String> messagesLoad = [
    'Cargando peliculas',
    'Cargando series',
    'Preparando palomitas',
    'Todos listos',
    'El cine tardara en abrir',
  ];

  Stream<String> getloadMessages() {
    return Stream.periodic(Duration(milliseconds: 1200), (message) {
      return messagesLoad[message];
    }).take(messagesLoad.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Espere porfavor'),
          SizedBox(height: 10),
          CircularProgressIndicator(),

          SizedBox(height: 10),

          StreamBuilder(
            stream: getloadMessages(),
            builder: (context, snapshot) {
              if(!snapshot.hasData)return Text('Cargando...');
              return Text('${snapshot.data}');
            },
          ),
        ],
      ),
    );
  }
}
