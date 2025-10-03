import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Theme Model
class ThemeModel extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}

// App Entry
class ThemeSwitcherApp extends StatelessWidget {
  const ThemeSwitcherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const ThemeSwitcherHome(),
        );
      },
    );
  }
}

// UI
class ThemeSwitcherHome extends StatelessWidget {
  const ThemeSwitcherHome({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Theme Switcher")),
      body: Center(
        child: SwitchListTile(
          title: const Text("Dark Mode"),
          value: themeModel.isDarkMode,
          onChanged: themeModel.toggleTheme,
        ),
      ),
    );
  }
}
