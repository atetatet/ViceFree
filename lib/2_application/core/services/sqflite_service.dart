import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'vicefree.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE vices (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        viceName TEXT,
        backgroundColor TEXT,
        timestamp INTEGER
      )
    ''');
    });
  }

  Future<void> saveVice(Map<String, dynamic> map) async {
    final db = await database;
    await db.insert(
        'vices',
        {
          'id': map['id'],
          'viceName': map['viceName'],
          'backgroundColor': map['backgroundColor'],
          'timestamp': map['timestamp'],
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> fetchVices() async {
    final db = await database;
    return await db.query('vices', orderBy: 'timestamp DESC');
  }

  Future<void> updateVice(int id, Map<String, dynamic> map) async {
    final db = await database;
    await db.update(
      'vices',
      {
        'viceName': map['viceName'],
        'backgroundColor': map['backgroundColor'],
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteVice(int id) async {
    final db = await database;
    await db.delete(
      'vices',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
