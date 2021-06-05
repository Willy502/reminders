import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(), // AQUI PUEDEN CONSTRIR EL CONTENIDO
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/drawer_background.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.alarm, color: Colors.blue),
            title: Text('Reminders'),
            onTap: () => Navigator.pushReplacementNamed(context, 'reminders'),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Settings'),
            onTap: () => Navigator.pushReplacementNamed(context, 'settings'),
          )
        ],
      ),
    );
  }
}