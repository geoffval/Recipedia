import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:recipedia/models/account.dart';

final database = openDatabase(
    join(getDatabasesPath() as String, 'account_database.db'),

    onCreate: (db, version) {
      return db.execute('CREATE TABLE account(id INTEGER PRIMARY KEY, username TEXT, email TEXT, password TEXT)');
    }
);

Future<void> insertAccount(Account account) async {
  final db = await database;

  await db.insert(
    'account',
    account.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Account>> account() async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('account');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Account(
      id: maps[i]['id'] as int,
      username: maps[i]['username'] as String,
      email: maps[i]['email'] as String,
      password: maps[i]['password'] as String
    );
  });
}

