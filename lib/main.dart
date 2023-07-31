import 'package:flutter/material.dart';
import 'package:peliculas_app/screens/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color appBarColor = const Color(0x001e2227);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen()
      },
      theme: ThemeData.dark()
          .copyWith(appBarTheme: AppBarTheme(color: appBarColor)),
    );
  }
}
