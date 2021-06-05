import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {

  // Singleton
  static Database? database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

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

}