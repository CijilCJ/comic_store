import 'package:comic_world/controller/authentication_controller.dart';
import 'package:comic_world/user/view/log_in_screen.dart';
import 'package:comic_world/user/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailControll=TextEditingController();
  final passWordControll=TextEditingController();
  final userNameControll=TextEditingController();
  final phoneNumberController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<AuthenticationController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 30,
          children: [
            Text("SignUp"),
            Text("Welcome to Comic book world"),
            Form(
              child: Column(
                spacing: 20,
              children: [
            textField(userNameControll, "label", "hint", Icons.person, (){}),
            textField(userNameControll, "label", "hint", Icons.person, (){}),
            textField(userNameControll, "label", "hint", Icons.person, (){}),
            textField(userNameControll, "label", "hint", Icons.person, (){}),
                ],
              )
            ),
            ElevatedButton(onPressed: (){}, child: Text("SignUp")),
            Row(
              children: [
                Text("Already have a Accunt?"),
                TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LogInScreen()));
                  }, 
                  child: Text("LogIn")),
              ],
            )
          ],
        ),
      ),
    );
  }
}