import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tasks'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Task('Learn Flutter'),
            Task('Learn Swift'),
            Task('Learn Python'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String name;
  const Task(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: Colors.deepPurpleAccent,
            height: 140,
          ),
          Container(
            color: Colors.white,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black26,
                  width: 72,
                  height: 100,
                ),
                Text(name),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_drop_up),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
