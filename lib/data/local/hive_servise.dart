import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_1/data/models/user/user_model.dart';

class HiveService {
  static Box db = Hive.box('db');

  static init() async {
    var doc = await getApplicationDocumentsDirectory();
    Hive.initFlutter();
    Hive.init(doc.path);
    Hive.registerAdapter(UserModelAdapter());
    await Hive.openBox("db");
  }

  static Future<Box<UserModel>> openBox() async {
    return await Hive.openBox<UserModel>('user');
  }

  static Future<void> addUser(UserModel user) async {
    final box = await openBox();
    await box.add(user);
  }

  static Future<List<UserModel>> getAllUsers() async {
    final box = await openBox();
    return box.values.toList();
  }

  static get(String key) {
    return db.get(key);
  }

  static set(String key, value) async {
    return db.put(key, value);
  }

  static delete(String key) async {
    return db.delete(key);
  }

  static clear() async {
    return db.clear();
  }

  static close() async {
    return db.close();
  }
}