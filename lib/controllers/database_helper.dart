import 'package:calculator/models/history_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "history.db";
  static const _databaseVersion = 1;
  static const table = 'history';
  static const columnId = '_id';
  static const columnExpression = 'expression';
  static const columnResult = 'result';
  static const columnDate = 'date';

  // torna a classe singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // tem somente uma referência ao banco de dados
  Database? db;

  Future<Database> get database async {
    if (db != null) return db!;
    // instancia o db na primeira vez que for acessado
    db = await _initDatabase();
    return db!;
  }

  // abre o banco de dados e o cria se ele não existir
  _initDatabase() async {
    final databashPath = await getDatabasesPath();
    final path = join(databashPath, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // Código SQL para criar o banco de dados e a tabela
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnExpression TEXT NOT NULL,
            $columnResult TEXT NOT NULL,
            $columnDate TEXT NOT NULL
          )
          ''');
  }

  Future insert(HistoryModel historyModel) async {
    Database db = await instance.database;
    return await db.rawInsert(
        'insert into $table ($columnExpression, $columnResult, $columnDate) values(?,?,?)',
        [
          historyModel.expression,
          historyModel.result,
          historyModel.date,
        ]);
  }

  /// Simple query with WHERE raw query
  Future<List<HistoryModel>> getAll() async {
    Database db = await instance.database;
    final res = await db.rawQuery("SELECT * FROM $table");
    List<HistoryModel> listHistory = [];
    for (Map m in res) {
      listHistory.add(HistoryModel.fromMap(m));
    }
    return listHistory;
  }

  Future deleteAll() async {
    Database db = await instance.database;
    return await db.execute('delete from $table;');
  }
}
