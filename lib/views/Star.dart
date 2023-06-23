import 'package:flutter/material.dart';
import 'package:flutter_recetas/views/home.dart';
import 'package:flutter/src/material/material_state.dart';
import 'package:flutter_recetas/views/CardDetailPage.dart';

import 'package:flutter_recetas/views/Favorite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 243, 236, 226), // Color de fondo ARGB
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:
                EdgeInsets.only(bottom: 49.0), // Margen inferior para el botón
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.translate(
                  offset: Offset(-90,
                      -45), // Desplazamiento hacia la derecha (50) y hacia arriba (-50)
                  child: Image.asset(
                    'foodie.png', // Ruta de la imagen en los assets
                    width: 400,
                    height: 400,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'DancingScript',
                      fontSize: 64,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: 'Foodie\n'),
                      TextSpan(text: 'Favorites'),
                    ],
                  ),
                ),
                SizedBox(height: 100),
                SizedBox(
                  width: 202,
                  height: 48, // Ajustar la altura deseada del botón
                  child: ElevatedButton(
                    child: Text('Ver recetas',
                        style: TextStyle(
                            fontSize: 20)), // Ajustar el tamaño del texto
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 102, 26, 26),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
