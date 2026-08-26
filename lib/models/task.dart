import 'dart:convert';

enum TaskPriority { low, medium, high }
enum TaskCategory { work, study, ideas, personal, goals }

class Task {
  final String id;
  String title;
  String description;
  bool completed;
  TaskPriority priority;
  TaskCategory category;
  DateTime? dueDate;
  final DateTime createdAt;

  Task({required this.id, required this.title, this.description = '', this.completed = false, this.priority = TaskPriority.medium, this.category = TaskCategory.personal, this.dueDate, DateTime? createdAt}) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() => {'id': id, 'title': title, 'description': description, 'completed': completed, 'priority': priority.name, 'category': category.name, 'dueDate': dueDate?.toIso8601String(), 'createdAt': createdAt.toIso8601String()};
  factory Task.fromMap(Map<String, dynamic> m) => Task(id: m['id'], title: m['title'], description: m['description'] ?? '', completed: m['completed'] ?? false, priority: TaskPriority.values.byName(m['priority'] ?? 'medium'), category: TaskCategory.values.byName(m['category'] ?? 'personal'), dueDate: m['dueDate'] == null ? null : DateTime.parse(m['dueDate']), createdAt: DateTime.parse(m['createdAt']));
  String encode() => jsonEncode(toMap());
  factory Task.decode(String value) => Task.fromMap(jsonDecode(value));
}
