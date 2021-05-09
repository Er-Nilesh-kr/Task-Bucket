import 'package:flutter/material.dart';
import 'package:task_app/screens/add_task_screen.dart';
import 'package:task_app/widgets/tasks_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/models/task.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'Buy demo1'),
    Task(name: 'Demo2'),
    Task(name: 'Demo3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                child: AddTaskScreen(
                  (newTaskTile) {
                    setState(
                      () {
                        tasks.add(Task(name: newTaskTile));
                      },
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          size: 35.0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.assignment_rounded,
                      size: 68.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 50.0,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text('Task Bucket',
                      style: GoogleFonts.pacifico(
                        textStyle: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(185, 0, 0, 0),
                            ),
                          ],
                        ),
                      )),
                  Text(
                    '   ${tasks.length} Tasks',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(tasks),
            ),
          )
        ],
      ),
    );
  }
}
