import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:monitoring/db_pool/monitoring_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBPool extends GetxService {
  late Database dbBase;
  final faker = Faker();

  Future<DBPool> init() async {
    await createMonitoringDB();
    return this;
  }

  createMonitoringDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'monitoring.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createMonitoringTable(db);
      await _initData(db);
    });
  }

  createMonitoringTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS monitoring (id INTEGER PRIMARY KEY, created_time TEXT, type INTEGER, input_number INTEGER)');
  }

  _initData(Database db) async {
    for (int i = 0; i < 100; i++) {
      final type = faker.randomGenerator.integer(4);
      var maxNum = 50;
      var minNum  = 0;
      switch (type) {
        case 0:
          maxNum = 40;
          minNum = 36;
          break;
        case 1:
          maxNum = 130;
          minNum = 70;
          break;
        case 2:
          maxNum = 130;
          minNum = 60;
          break;
        case 3:
          maxNum = 30;
          minNum = 10;
      }
      await db.insert('monitoring', {
        'created_time':
            DateTime.now().subtract(Duration(minutes: 2 * i)).toIso8601String(),
        'type': type,
        'input_number': faker.randomGenerator.integer(maxNum,min: minNum)
      });
    }
  }

  cleanAllData() async {
    await dbBase.delete('monitoring');
  }

  Future<List<MonitoringEntity>> getAllData() async {
    var result = await dbBase.query('monitoring', orderBy: 'created_time DESC');
    return result.map((e) => MonitoringEntity.fromJson(e)).toList();
  }
}
