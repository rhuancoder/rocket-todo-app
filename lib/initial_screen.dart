import 'package:flutter/material.dart';
import 'package:rocket_todo_app/task.dart';

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
        title: Text('Tasks'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: Duration(milliseconds: 800),
        child: ListView(
          children: [
            Task(
              'Learn Flutter',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHfvJQdTD8IFAUS4jNkFrVYGai1NknAbHAMA&s',
              3,
            ),
            Task(
              'Learn Swift',
              'https://developer.apple.com/swift/images/swift-og.png',
              2,
            ),
            Task(
              'Learn Python',
              'https://i.pinimg.com/originals/82/a2/18/82a2188c985ce75402ae44fc43fe7e5e.png',
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