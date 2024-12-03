import 'package:flutter/material.dart';
import 'package:twenty_forty_eight/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2048',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        ),
        useMaterial3: true,
      ),
      home: const GameHomePage(title: '2048'),
    );
  }
}
