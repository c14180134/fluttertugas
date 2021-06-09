import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String desc;
  TaskCardWidget({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 20.0,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "Get Started",
            style: TextStyle(
                color: Colors.amber,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Text(
            desc ?? "Nothing to See Here",
            style: TextStyle(
              fontSize: 16.0,
              height: 1.5,
            ),
          )
        ],
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  final String text;
  final bool isDone;
  TodoWidget({this.text, @required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              right: 16.0,
            ),
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
                color: isDone ? Color(0xFF7349FE) : Colors.transparent,
                borderRadius: BorderRadius.circular(5.0),
                border: isDone
                    ? null
                    : Border.all(
                        color: Color(0xFF86829D),
                        width: 1.5,
                      )),
            child: Image(
              image: AssetImage('images/check.png'),
            ),
          ),
          Text(
            text ?? "Unnamed ",
            style: TextStyle(
              color: isDone ? Color(0xFF211551) : Color(0xFF86829D),
              fontSize: 16.0,
              fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
