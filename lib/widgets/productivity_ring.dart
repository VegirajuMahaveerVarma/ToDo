import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProductivityRing extends StatelessWidget {
  final double progress;
  const ProductivityRing({super.key, required this.progress});
  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<double>(tween: Tween(begin: 0, end: progress), duration: const Duration(milliseconds: 900), curve: Curves.easeOutCubic, builder: (_, value, __) => SizedBox(width: 178, height: 178, child: Stack(alignment: Alignment.center, children: [SizedBox(width: 168, height: 168, child: CircularProgressIndicator(value: value, strokeWidth: 12, backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(.45), valueColor: const AlwaysStoppedAnimation(AppTheme.accent))), Column(mainAxisSize: MainAxisSize.min, children: [Text('${(value * 100).round()}%', style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w800, letterSpacing: -1)), Text('Daily Progress', style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurfaceVariant))])])));
}
