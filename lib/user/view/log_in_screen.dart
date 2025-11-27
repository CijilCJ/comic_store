import 'package:comic_world/controller/authentication_controller.dart';
import 'package:comic_world/user/view/bottom_nav_bar.dart';
import 'package:comic_world/user/view/sign_up_screen.dart';
import 'package:comic_world/user/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final emailCntrl = TextEditingController();
  final passwordCntrl = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // final provider=Provider.of<AuthenticationController>(context);
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
              SizedBox(height: 20),
              Form(
                child: Column(
                  spacing: 20,
                  children: [
                    textField(
                      emailCntrl,
                      "Email",
                      "Enter a email Id",
                      Icons.message,
                      (value) {
                      if (value == null || value.isEmpty) {
                        return "Email required";
                      }
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                    ),
                    textField(
                      passwordCntrl,
                      "Password",
                      "Enter a Password",
                      Icons.add,
                      (value) {
                        if (value == null) {
                          return "Password Required";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await Supabase.instance.client.auth.signInWithPassword(
                          email: emailCntrl.text.trim(),
                          password: passwordCntrl.text.trim(),
                        );
                        if (mounted) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => BottomNavBar(),
                            ), // Replace with your home page
                          );
                        }
                      },
                      child: Text("LogIn"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Divider(), Text("or"), Divider()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" Does'Not have a Accunt "),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => SignUpScreen()),
                            );
                          },
                          child: Text("SignUp"),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 30,
                        height: 30,
                        child: Icon(Icons.g_mobiledata),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}










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

