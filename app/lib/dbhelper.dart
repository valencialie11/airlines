import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "database.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase(); // only initialize if not created already
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);

    if (!(await databaseExists(path))) {
      ByteData data = await rootBundle.load(join("assets", _databaseName));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }
    return await openDatabase(path, version: _databaseVersion);
  }

  String join(String s, String databaseName) {}


  Future<List<String>> getmealsbyseat(String seat) async {
    List<String> resultMeals;
    List<String> columnsToSelect = ['food']; // which columns you want in result
    String whereString = 'seat = ?'; // the where clause list
    List<dynamic> whereArguments = [seat]; // parameters for whereString (?)
    Database db = await instance.database;
    List<Map> result = await db.query('meals',
        columns: columnsToSelect,
        where: whereString,
        whereArgs: whereArguments);
    if (result == null)
      resultMeals = [];
    else {
      resultMeals =
          List.generate(result.length, (index) => result[index]['food']);

      return resultMeals;
    }
  }
}