import 'package:flutter/material.dart';
import 'package:rocket_todo_app/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tasks'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task(
              'Learn Flutter',
              'assets/images/flutter-logo.png',
              3,
            ),
            Task(
              'Learn Swift',
              'assets/images/swift-logo.png',
              2,
            ),
            Task(
              'Learn Python',
              'assets/images/python-logo.png',
              4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: Icon(
          opacity ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
        ),
      ),
    );
  }
}