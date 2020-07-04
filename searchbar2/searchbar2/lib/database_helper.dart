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
        "image TEXT,"
        "status TEXT"
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
      await dbClient.insert('Customer', employee[i]);

      print("insertion success");
    }
//    return employee;
    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }
  Future<List> retrivalful() async{
    var dbClient = await db;
    List<Map> maps1 = await dbClient.rawQuery("SELECT * FROM Customer");
    print(maps1);
  }
  Future<List> retrival1() async{
    var dbClient = await db;
    List<Map> maps1 = await dbClient.rawQuery("SELECT * FROM Customer WHERE status = 'pen'");
    return maps1;
  }
  Future<List> retrival2() async{
    var dbClient = await db;
    List<Map> maps1 = await dbClient.rawQuery("SELECT * FROM Customer WHERE status = 'Given'");
    return maps1;
  }
  Future<List> retrival3() async{
    var dbClient = await db;
    List<Map> maps1 = await dbClient.rawQuery("SELECT * FROM Customer WHERE status = 'Dead'");
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
  Future<int> deleteNote() async {
    var db = await this.db;
    await db.rawDelete('DELETE FROM Customer');
    print("Success");
  }
}