import 'package:flutter/material.dart';
import 'package:reminders/src/shared/user_preferences.dart';
import 'package:reminders/src/widgets/drawer_widget.dart';

class SettingsPage extends StatefulWidget {

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario = false;
  int _genero = 1;
  final preferences = UserPreferences();

  @override
  void initState() { 
    super.initState();
    _genero = preferences.genero;
    _colorSecundario = preferences.colorSecundario;
  }

  _setSelectedRadion(int value) {
    _genero = value;
    preferences.genero = _genero;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: preferences.colorSecundario ? Colors.indigo : Colors.blue,
      ),
      drawer: DrawerWidget(),
      body: ListView(
        children: [
          SizedBox(height: 20.0),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color Secundario'),
            onChanged: (value) {
              _colorSecundario = value;
              preferences.colorSecundario = _colorSecundario;
              setState(() {});
            }
          ),
          Divider(),
          RadioListTile(
            value: 1,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: (val) {
              _setSelectedRadion(val as int);
            }
          ),
          RadioListTile(
            value: 2,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: (val) {
              _setSelectedRadion(val as int);
            }
          )
        ],
      ),
    );
  }
}