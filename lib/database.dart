import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(join(await getDatabasesPath(),' '),
    onCreate: (db, version)
      {
         return db.execute('CREATE TABLE Meds(id INTEGER PRIMARY KEY, name TEXT,dose INTEGER)');
      },
      version: 1,
  );
  Future<void> insertMeds(Meds meds) async
  {
      final db = await database;
      
      await db.insert('vicks',meds.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<List<Meds>> meds() async
  {
      var db;
      final List<Map<String, dynamic>> maps = await db.query('meds');
      return List.generate(maps.length, (i) {
        return Meds(
          id: maps[i]['id'],
          name: maps[i]['name'],
          dose: maps[i]['dose'],
        );
      });
  }
  Future<void> updateMeds(Meds meds)async
  {
    final db = await database;
    await db.update('Meds', meds.toMap(),
    where: 'id = ?',
    whereArgs: [meds.id],);
  }
  Future<void> deleteMeds(int id)async
  {
    final db = await database;
    await db.delete('Meds',
    where: 'id = ?',
    whereArgs: [id],);
  }
  var vicks = Meds(
      id: 0,
      name: 'VicksTab ',
      dose: 1,
  );
  await insertMeds(vicks);
  print(await meds());
  vicks = Meds(
    id: vicks.id,
    name: vicks.name,
    dose: vicks.dose + 1,
  );
  await updateMeds(vicks);
  print (await meds());
}
class Meds{
  final int id;
  final String name;
  final int dose;
  Meds({required this.id,required this.name,required this.dose});
  Map<String, dynamic> toMap()
  {
    return{
      'id': id,
      'name': name,
      'dose': dose,
    };
  }
  @override
  String toString()
  {
    return 'Meds{id: $id, name: $name,dose: $dose}';
  }
}
