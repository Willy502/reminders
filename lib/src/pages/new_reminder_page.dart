import 'package:flutter/material.dart';
import 'package:reminders/src/shared/user_preferences.dart';

class NewReminderPage extends StatelessWidget {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final preferences = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Reminder'),
        backgroundColor: preferences.colorSecundario ? Colors.indigo : Colors.blue,
        actions: [
          IconButton(onPressed: () { _saveReminder(context); }, icon: Icon(Icons.check))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                hintText: 'Reminder',
                labelText: 'Reminder\'s name',
                prefixIcon: Icon(Icons.alarm)
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _detailController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                hintText: 'Detail',
                labelText: 'Reminder\'s detail',
                prefixIcon: Icon(Icons.details)
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveReminder(BuildContext context) {
    final String name = _nameController.text;
    final String detail = _detailController.text;

    if (name != "" && detail != "") {
      // AQUI GUARDO EL REMINDER
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Faltan datos')));
    }
  }
}