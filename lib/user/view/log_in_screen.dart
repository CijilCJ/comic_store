import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final emailCntrl=TextEditingController();
  final passwordCntrl=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 20,
          children: [
            Text("LogIn"),
          Form(
            child: TextField(
              controller: emailCntrl,
          ),
          )
        ],),
      ),
    );
  }
}