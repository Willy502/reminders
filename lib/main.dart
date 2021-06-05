import 'package:flutter/material.dart';
import 'package:reminders/src/routes/routes.dart';
import 'package:reminders/src/shared/user_preferences.dart';
 
void main() async {
  // Cargamos preferencias antes de cargar toda la aplicación
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = UserPreferences();
  await preferences.initPreferences();
  return runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminders',
      debugShowCheckedModeBanner: false,
      routes: getApplicatiobRoutes(),
      initialRoute: 'reminders',
    );
  }
}