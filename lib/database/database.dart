import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:solve/model/book.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DatabaseHelper {
  static const _databaseName = "book.db";
  static const _databaseVersion = 1;
  static const table = 'Bookdb';
  static const columnId = '_id';
  static const columnAuthorName = 'authorName';
  static const columnBookName = 'bookName';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String dataPath = p.join(dbPath, _databaseName);

    log(dataPath);

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = p.join(documentsDirectory.path, _databaseName);
    log(path);

    return await openDatabase(dataPath,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table(
	  $columnId INTEGER PRIMARY KEY
  , $columnAuthorName  TEXT
  ,$columnBookName TEXT      


);
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row,
        conflictAlgorithm: ConflictAlgorithm.replace, nullColumnHack: "");
  }

  Future<List<Book>> queryAllRows() async {
    Database db = await instance.database;
    final data = await db.query(table);
    log(data.toString());
    final List<Book> bookList =
        data.map<Book>((e) => Book.fromJson(e)).toList();

    return bookList;
  }

  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    var i = await db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(i);
  }
}
