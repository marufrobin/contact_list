import 'package:contact_list/models/model_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const String createTableContact = '''create table $tableContact(
  $tableContactColId integer primary key,
  $tableContactColName text,
  $tableContactColPhone text,
  $tableContactColAddress text,
  $tableContactColDob text,
  $tableContactColGender text,
  $tableContactColImage text)''';

  static Future<Database> openDb() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, "contact.db");
    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(createTableContact);
      },
    );
  }

  static Future<int> insertContact(ModelData modelData) async {
    final db = await openDb();
    return db.insert(tableContact, modelData.toMap());
  }
}
