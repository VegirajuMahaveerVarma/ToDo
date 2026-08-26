import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class StorageService {
  static const _key = 'future_productivity_tasks';
  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(_key) ?? []).map(Task.decode).toList();
  }
  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, tasks.map((t) => jsonEncode(t.toMap())).toList());
  }
  Future<void> clear() async => (await SharedPreferences.getInstance()).remove(_key);
}
