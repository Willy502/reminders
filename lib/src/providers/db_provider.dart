import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reminders/src/models/reminder_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {

  // Singleton
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'Reminders2DB.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Reminders ('
          ' id INTEGER PRIMARY KEY,'
          ' name TEXT,'
          ' detail TEXT'
          ')'
        );
    }); // LA VERSION SE DEBE INCREMENTARA CON CADA CAMBIO PARA IMPACTAR EN EL ARCHIVO DE BASE DE DATOS
  }

  // CREAR REGISTROS
  Future<int?> newReminderRaw(ReminderModel reminder) async {
    final db = await database;
    final res = await db?.insert('Reminders', reminder.toJson());
    return res;
  }

  // ELIMINAR REGISTROS
  Future<int?> deleteReminder(int id) async {
    final db = await database;
    final res = await db?.delete('Reminders', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  // RECUPERAR REGISTROS
  Future<List<ReminderModel>?> getReminders() async {
    final db = await database;
    final res = await db?.query('Reminders');

    List<ReminderModel>? reminders = res!.isNotEmpty
        ? res.map((reminder) => ReminderModel.fromJson(reminder)).toList()
        : [];

    return reminders;
  }

}