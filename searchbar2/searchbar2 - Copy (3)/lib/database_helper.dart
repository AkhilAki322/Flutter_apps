import 'package:sqflite/sqflite.dart';
import 'note.dart';
class DBHelper{
  static Database _db;
  static const String ID = 'id';
  createDatabase() async{
    print("create database");
    String databasePath = await getDatabasesPath();
    String dbPath = databasePath + 'my.db';
    var database = await openDatabase(dbPath, version: 1, onCreate: populatedDb);
    return database;
  }
  void populatedDb(Database database, int version) async{
    print("create table");
    await database.execute("CREATE TABLE Customer ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "pen_id TEXT,"
        "name TEXT,"
        "Address TEXT,"
        "Adhar TEXT,"
        "phone TEXT,"
        "amount TEXT,"
        "image TEXT"
        ")");
  }
  Future<Database> get db async {
    print("db");
    if (_db != null) {
      return _db;
    }
    _db = await createDatabase();
    return _db;
  }
  Future insertion(employee) async {
    for(int i=0; i<employee.length; i++) {
      var dbClient = await db;
      var result = await dbClient.insert('Customer', employee[i]);

      print("insertion success");
      print(result);
    }
//    return employee;
    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }
  Future<List> retrival1() async{
    var dbClient = await db;
    List<Map> maps1 = await dbClient.rawQuery("SELECT * FROM Customer");
    return maps1;
  }
  Future<List> retrival(name) async {
    print("get employees");
    var dbClient = await db;
//    List<Map> maps = await dbClient.query('Customer', columns: ['id', 'pen_id', 'name']);
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM Customer WHERE name = '$name'");
//    print(maps[0]);
//    List<Note> noteList = [];
//    noteList.add(Note.fromMap(maps[0]));
//    List employees = [];
//    if (maps.length > 0) {
//      for (int i = 0; i < maps.length; i++) {
//        employees.add(Employee.fromMap(maps[i]));
//      }
//    }
    return maps;
  }
  Future<int> update(Note employee) async {
    var dbClient = await db;
    return await dbClient.update('Customer', employee.toMap(),
        where: '$ID = ?', whereArgs: [employee.id]);
  }
}