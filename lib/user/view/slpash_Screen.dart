import 'package:comic_world/user/view/log_in_screen.dart';
import 'package:flutter/material.dart';

class SlpashScreen extends StatefulWidget {
  const SlpashScreen({super.key});

  @override
  State<SlpashScreen> createState() => _SlpashScreenState();
}

class _SlpashScreenState extends State<SlpashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LogInScreen()));}, child: Text("login")),
    );
  }
}