import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/count_provider.dart';
import 'package:provider_test/provider/example_1_provider.dart';
import 'package:provider_test/provider/like_provider.dart';
import 'package:provider_test/provider/theme_changer_provider.dart';
import 'package:provider_test/screens/favourit/like_screen.dart';
import 'package:provider_test/screens/value_notifier_listener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Multi Provider To Use Multiple Provider..
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => Example1Provider()),
        ChangeNotifierProvider(create: (_) => LikeProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider())
      ],
      child: Builder(
        builder: (BuildContext context) {
          // for theme management through out the app
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            themeMode: themeChanger.themeMode,
            title: 'Provider Demo',
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(color: Colors.blue),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.green,
              iconTheme: IconThemeData(color: Colors.green),
              appBarTheme: AppBarTheme(color: Colors.teal),
            ),
            home: ValueNotifierListener(),
          );
        },
      ),
    );
  }
}
