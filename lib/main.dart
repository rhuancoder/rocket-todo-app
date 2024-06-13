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
        body: ListView(
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

class Task extends StatefulWidget {
  final String name;

  const Task(this.name, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.deepPurpleAccent,
              height: 140,
            ),
            Column(
              children: [
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
                      Container(
                        width: 200,
                        child: Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 20, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            level++;
                          });
                          print(level);
                        },
                        child: Icon(Icons.arrow_drop_up),
                      )
                    ],
                  ),
                ),
                Text(
                  'Level $level',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
