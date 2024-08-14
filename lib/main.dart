import 'package:flutter/material.dart';
import 'package:silk_innovation_aakash/screens/memory_game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MemoryGameScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
