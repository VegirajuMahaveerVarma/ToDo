import 'package:flutter/material.dart';
import '../models/task.dart';

class CategorySelector extends StatelessWidget {
  final TaskCategory selected; final ValueChanged<TaskCategory> onChanged;
  const CategorySelector({super.key, required this.selected, required this.onChanged});
  IconData icon(TaskCategory c) => switch(c){TaskCategory.work=>Icons.work_outline,TaskCategory.study=>Icons.menu_book_outlined,TaskCategory.ideas=>Icons.lightbulb_outline,TaskCategory.personal=>Icons.person_outline,TaskCategory.goals=>Icons.track_changes};
  String label(TaskCategory c) => c.name[0].toUpperCase()+c.name.substring(1);
  @override Widget build(BuildContext context) => SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: TaskCategory.values.map((c)=>Padding(padding: const EdgeInsets.only(right:8), child: ChoiceChip(label: Text(label(c)), avatar: Icon(icon(c),size:17), selected:selected==c, onSelected:(_)=>onChanged(c)))).toList()));
}
