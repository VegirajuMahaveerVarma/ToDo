import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onComplete;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const TaskItem({super.key, required this.task, required this.onComplete, required this.onDelete, required this.onTap});

  String _time() {
    if (task.dueDate == null) return 'No due time';
    final d = task.dueDate!;
    return '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    return Dismissible(
      key: ValueKey(task.id),
      background: _swipeBackground(Icons.done_rounded, Alignment.centerLeft, Colors.green),
      secondaryBackground: _swipeBackground(Icons.delete_outline, Alignment.centerRight, Colors.red),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          onComplete();
          return false;
        }
        onDelete();
        return true;
      },
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(colors: [
              c.surface.withValues(alpha: .82),
              c.surfaceContainerHighest.withValues(alpha: .38),
            ]),
            border: Border.all(color: c.outline.withValues(alpha: .08)),
          ),
          child: Row(children: [
            GestureDetector(
              onTap: onComplete,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: task.completed ? c.primary : Colors.transparent,
                  border: Border.all(color: task.completed ? c.primary : c.onSurfaceVariant, width: 2),
                ),
                child: task.completed ? Icon(Icons.check, size: 18, color: c.onPrimary) : null,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    decoration: task.completed ? TextDecoration.lineThrough : null,
                    color: task.completed ? c.onSurfaceVariant : null,
                  ),
                ),
                const SizedBox(height: 7),
                Row(children: [
                  Text('●', style: TextStyle(fontSize: 12, color: task.priority == TaskPriority.high ? c.primary : task.priority == TaskPriority.medium ? c.secondary : c.outline)),
                  const SizedBox(width: 6),
                  Text(_time(), style: TextStyle(fontSize: 12, color: c.onSurfaceVariant)),
                  const SizedBox(width: 10),
                  Text(task.category.name, style: TextStyle(fontSize: 12, color: c.onSurfaceVariant)),
                ]),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _swipeBackground(IconData icon, Alignment alignment, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: alignment,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: color.withValues(alpha: .15), borderRadius: BorderRadius.circular(24)),
      child: Icon(icon),
    );
  }
}
