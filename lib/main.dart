import 'package:flutter/material.dart';

import 'difficulty.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
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
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String name;
  final String photo;
  final int difficulty;

  const Task(this.name, this.photo, this.difficulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;
  final double borderRadius = 7;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: Colors.deepPurpleAccent,
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(borderRadius),
                          color: Colors.white,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(borderRadius),
                          child: Image.network(
                            widget.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Difficulty(
                            difficultyLevel: widget.difficulty,
                          ),
                        ],
                      ),
                      Container(
                        height: 68,
                        width: 68,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              level++;
                            });
                            print(level);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.difficulty > 0)
                              ? (level / widget.difficulty) / 10
                              : 1,
                        ),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Level $level',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


