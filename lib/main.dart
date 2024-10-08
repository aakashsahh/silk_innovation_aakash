import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silk_innovation_aakash/blocs/memory_game_bloc.dart';
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
      home: BlocProvider(
        create: (_) => MemoryGameBloc(),
        child: const MemoryGameScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
