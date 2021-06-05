import 'package:flutter/material.dart';
import 'package:reminders/src/widgets/drawer_widget.dart';

class RemindersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      drawer: DrawerWidget(),
    );
  }
}