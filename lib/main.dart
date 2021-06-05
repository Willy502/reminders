import 'package:flutter/material.dart';
import 'package:reminders/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
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