import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/auth_provider.dart';
import 'package:provider_test/provider/count_provider.dart';
import 'package:provider_test/provider/example_1_provider.dart';
import 'package:provider_test/provider/like_provider.dart';
import 'package:provider_test/provider/theme_changer_provider.dart';
import 'package:provider_test/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Multi Provider To Use Multiple Provider..
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => Example1Provider()),
        ChangeNotifierProvider(create: (_) => LikeProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
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
            home: LoginPageScreen(),
          );
        },
      ),
    );
  }
}
