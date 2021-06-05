import 'package:flutter/material.dart';
import 'package:reminders/src/shared/user_preferences.dart';
import 'package:reminders/src/widgets/drawer_widget.dart';

class RemindersPage extends StatelessWidget {
  final preferences = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
        backgroundColor: preferences.colorSecundario ? Colors.indigo : Colors.blue,
      ),
      drawer: DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: preferences.colorSecundario ? Colors.indigo : Colors.blue,
        onPressed: () => Navigator.pushNamed(context, 'new_reminder')
      ),
    );
  }
}