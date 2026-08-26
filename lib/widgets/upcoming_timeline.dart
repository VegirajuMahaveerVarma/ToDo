import 'package:flutter/material.dart';
import '../models/task.dart';

class UpcomingTimeline extends StatelessWidget {
  final List<Task> tasks;
  const UpcomingTimeline({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 115,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tasks.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final t = tasks[i];
          final d = t.dueDate!;
          final day = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'][d.weekday - 1];
          return Container(
            width: 210,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border(left: BorderSide(color: scheme.primary, width: 3)),
              gradient: LinearGradient(colors: [scheme.surfaceContainerHighest.withValues(alpha: .55), Colors.transparent]),
              borderRadius: const BorderRadius.only(topRight: Radius.circular(22), bottomRight: Radius.circular(22)),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('$day  ${d.day}', style: const TextStyle(fontWeight: FontWeight.w800)),
              const Spacer(),
              Text(t.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              Text('${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}', style: TextStyle(fontSize: 11, color: scheme.onSurfaceVariant)),
            ]),
          );
        },
      ),
    );
  }
}
