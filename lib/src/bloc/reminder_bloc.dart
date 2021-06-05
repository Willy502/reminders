import 'dart:async';

import 'package:reminders/src/models/reminder_model.dart';
import 'package:reminders/src/providers/db_provider.dart';

class RemindersBloc {

  // Singleton
  static final RemindersBloc _singleton = RemindersBloc._();

  factory RemindersBloc() {
    return _singleton;
  }

  RemindersBloc._();

  final _remindersStreamController = StreamController<List<ReminderModel>?>.broadcast();
  Stream<List<ReminderModel>?> get remindersStream => _remindersStreamController.stream;

  void dispose() {
    _remindersStreamController.close();
  }

  getReminders() async {
    _remindersStreamController.sink.add(await DBProvider.db.getReminders());
  }

  addReminder(ReminderModel reminder) async {
    await DBProvider.db.newReminderRaw(reminder);
    getReminders();
  }

  deleteReminder(int id) async {
    await DBProvider.db.deleteReminder(id);
    getReminders();
  }

}