
import 'package:comic_world/user/view/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    // final provider=Provider.of<AuthenticationController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Verification Email",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text("Enter the OTP sent to your email:"),
          
              ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>BottomNavBar()));
                }, 
                child: Text("Verify")
              )
            ],
          ),
        ),
      ),
    );
  }
}