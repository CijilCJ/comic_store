import 'package:comic_world/user/view/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OtpVerifyPage extends StatefulWidget {
  final String userName;
  final String email;
  final String mobile;

  const OtpVerifyPage({
    super.key,
    required this.userName,
    required this.email,
    required this.mobile,
  });

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  String pin = "";
  bool isLoading = false;

  void addDigit(String digit) {
    if (pin.length < 6) {
      setState(() {
        pin += digit;
      });
    }
  }

  Future<void> verifyOtp() async {
    if (pin.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter 6 digit OTP")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final supabase = Supabase.instance.client;

      await supabase.auth.verifyOTP(
        type: OtpType.email,
        email: widget.email,
        token: pin,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const BottomNavBar()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid OTP: $e")));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(height: 10),
           Center(
             child: Text("Verification Email",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
           ),
            Text('Enter the OTP sent to your email: ${widget.email}'),
        
            Text(
              pin.padRight(6, "_"), 
              style: TextStyle(fontSize: 32, letterSpacing: 10),
            ),
        
            ElevatedButton(
              onPressed: isLoading ? null : verifyOtp,
              child: isLoading
                  ? CircularProgressIndicator()
                  : Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
