import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(), // AQUI PUEDEN CONSTRIR EL CONTENIDO
            
          )
        ],
      ),
    );
  }
}