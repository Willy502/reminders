import 'package:flutter/material.dart';
import 'package:reminders/src/bloc/reminder_bloc.dart';
import 'package:reminders/src/shared/user_preferences.dart';
import 'package:reminders/src/widgets/drawer_widget.dart';

class RemindersPage extends StatelessWidget {
  final preferences = UserPreferences();
  final remindersBloc = RemindersBloc();

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
      body: _remindersList(),
    );
  }

  StreamBuilder _remindersList() {
    return StreamBuilder(
      stream: remindersBloc.remindersStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final reminders = snapshot.data;

        if (reminders.length == 0) {
          return Center(child: Text('You don\'t have any reminder'));
        }

        return ListView.builder(
          itemCount: reminders.length,
          itemBuilder: (context, position) => Column(
            children: [
              ListTile(
                title: Text(reminders[position].name),
                subtitle: Text(reminders[position].detail),
              ),
              Divider()
            ],
          )
        );
      }
    );
  }
}