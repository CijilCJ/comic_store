import 'package:comic_world/user/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final emailCntrl= TextEditingController();
  final passwordCntrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Text("LogIn"),
              Text("Welcome Back to our comic book store"),
              SizedBox(height: 20,),
              Form(child: Column(
                spacing: 20,
                children: [
                  textField(
                    emailCntrl, 
                    "Email", 
                    "Enter a email Id", 
                    Icons.message, 
                    (value){
                      if (value==null) {
                        return "Password Required";
                      }else if(value.length<6){
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    }),
                    textField(passwordCntrl, "Password", "Enter a Password", Icons.add, (){}),
                    ElevatedButton(onPressed: (){}, child: Text("LogIn")),
                    Row(
                      children: [
                        Divider(),
                        Text("or"),
                        Divider(),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                       
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        child: Icon(Icons.g_mobiledata),
                      ),
                    )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}



//  if (value == null || value.isEmpty) {
//                           return "Password required";
//                         } else if (value.length < 6) {
//                           return "Password must be at least 6 characters";
//                         }
//                         return null;

// if (value == null || value.isEmpty) {
                    //     return "Email required";
                    //     }
                    //     final emailRegex = RegExp(
                    //       r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    //     );
                    //     if (!emailRegex.hasMatch(value)){
                    //       return "Enter a valid email";
                    //     }
                    //     return null;