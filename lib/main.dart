import 'package:flutter/material.dart';
import 'screens/home_screen_fixed.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FutureProductivityApp());
}

class FutureProductivityApp extends StatefulWidget {
  const FutureProductivityApp({super.key});
  @override State<FutureProductivityApp> createState() => _AppState();
}

class _AppState extends State<FutureProductivityApp> {
  bool dark = true;

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Future Productivity',
    theme: AppTheme.light(),
    darkTheme: AppTheme.dark(),
    themeMode: dark ? ThemeMode.dark : ThemeMode.light,
    home: HomeScreenFixed(dark: dark, onDark: (v) => setState(() => dark = v)),
  );
}
