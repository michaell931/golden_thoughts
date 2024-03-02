import 'package:flutter/material.dart';

class GeneratePage extends StatefulWidget {
  const GeneratePage({super.key});

  @override
  State<GeneratePage> createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('tutaj generujemy dane'),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
