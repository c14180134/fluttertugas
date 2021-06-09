import 'package:appto/databasehelper.dart';
import 'package:appto/models/task.dart';
import 'package:appto/widget.dart';
import 'package:flutter/material.dart';

class Taskpage extends StatefulWidget {
  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.0,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24.0,
                            horizontal: 10.0,
                          ),
                          child: Image(
                            image: AssetImage('images/backarrow.png'),
                            width: 20,
                          ),
                        ),
                      ),
                      Expanded(
                          child: TextField(
                        onSubmitted: (value) {
                          if (value != "") {
                            Task _newTasks = Task(title: value);
                            DatabaseHelper _dbhelper = DatabaseHelper();
                            _dbhelper.insertTask(_newTasks);
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Title...",
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12.0,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Description...",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        )),
                  ),
                ),
                TodoWidget(
                  text: "Create your First Task",
                  isDone: false,
                ),
                TodoWidget(
                  text: "Create your first to do ",
                  isDone: false,
                ),
                TodoWidget(
                  isDone: false,
                ),
                TodoWidget(
                  isDone: false,
                ),
              ],
            ),
            Positioned(
              bottom: 24.0,
              right: 24.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Taskpage()),
                  );
                },
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      color: Color(0xFFFE3577),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Image(
                    width: 30.0,
                    height: 30.0,
                    image: AssetImage('images/delete.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
