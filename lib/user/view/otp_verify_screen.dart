import 'package:flutter/material.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Verification Email",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("Enter the OTP sent to your email:"),

            ElevatedButton(
              onPressed: (){
                
              }, 
              child: Text("Verify")
            )
          ],
        ),
      ),
    );
  }
}