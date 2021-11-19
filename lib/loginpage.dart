import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginui/models.dart';
import 'package:loginui/result_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff99499E),
        body: ListView(
          padding: EdgeInsets.all(12),
          children: [
            sizedBoxWidget(MediaQuery.of(context).size.height * 0.15),
            loginText(),
            sizedBoxWidget(15.0),
            userNameWidget(),
            sizedBoxWidget(15.0),
            passwordWidget(),
            sizedBoxWidget(20.0),
            reminderForgetWidget(),
            sizedBoxWidget(45.0),
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget loginButton() {
    return Expanded(
      child: Container(
          height: 60,
          child: Center(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      user: MyProfile(
                        name: userNameController.text,
                        password: passwordController.text,
                      ),
                    ),
                  ));
            },
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(25))),
    );
  }

  Widget reminderForgetWidget() {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Row(
            children: [
              Icon(
                Icons.check_box,
                size: 15,
                color: Colors.white,
              ),
              Text(
                "Reminder me",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Text(
            "Forget me ?",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget loginText() {
    return Text(
      'Login',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
      textAlign: TextAlign.center,
    );
  }

  Widget userNameWidget() {
    return Expanded(
        child: Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(0)),
      child: TextField(
        controller: userNameController,
        onChanged: (value) {
          setState(() {
            userNameController.text = value;
          });
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            labelText: "User name",
            labelStyle: TextStyle(color: Colors.white)),
      ),
    ));
  }

  Widget passwordWidget() {
    return Expanded(
        child: Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(0)),
      child: TextField(
        controller: passwordController,
        onChanged: (value) {
          setState(() {
            passwordController.text = value;
          });
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.lock,
                color: Colors.white,
              ),
            ),
            labelText: "PassWord",
            labelStyle: TextStyle(color: Colors.white)),
      ),
    ));
  }

  Widget sizedBoxWidget(double height) {
    return SizedBox(height: height);
  }
}
