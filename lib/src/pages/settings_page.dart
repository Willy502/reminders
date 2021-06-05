import 'package:flutter/material.dart';
import 'package:reminders/src/widgets/drawer_widget.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: DrawerWidget(),
    );
  }
}