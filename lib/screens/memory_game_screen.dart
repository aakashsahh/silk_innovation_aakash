import 'package:flutter/material.dart';

class MemoryGameScreen extends StatelessWidget {
  final int gridSize = 4; // 4x4 grid

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Memory Game')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridSize,
        ),
        itemCount: gridSize * gridSize,
        itemBuilder: (context, index) {
          return Card(
            child: Center(child: Text('Card $index')),
          );
        },
      ),
    );
  }
}
