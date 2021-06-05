import 'package:flutter/material.dart';
import 'package:reminders/src/pages/reminders_page.dart';
import 'package:reminders/src/pages/settings_page.dart';

Map<String, WidgetBuilder> getApplicatiobRoutes() {
  return <String, WidgetBuilder> {
    'reminders' : (context) => RemindersPage(),
    'settings' : (context) => SettingsPage()
  };
}