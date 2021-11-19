import 'package:flutter/material.dart';
import 'package:loginui/models.dart';

class ResultPage extends StatefulWidget {

  final MyProfile user;



   ResultPage({Key? key,  required this.user}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Email : ${widget.user.name}"),
          Text("Password : ${widget.user.password}")
        ],
      ),
    );
  }
}
