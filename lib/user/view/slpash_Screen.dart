import 'dart:async';

import 'package:comic_world/user/view/bottom_nav_bar.dart';
import 'package:comic_world/user/view/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkUser();
    });
  }


  Future<void> _checkUser() async {
    final supabase = Supabase.instance.client;

    await Future.delayed(Duration(seconds: 2));
    final session = supabase.auth.currentSession;
    final user = session?.user;
 
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogInScreen()),
      );
      return;
    }

    try {
      final userDoc =
          await supabase
              .from("comic_store")
              .select()
              .eq("id", user.id)
              .maybeSingle();

      final role = userDoc!['role'] ?? 'user';

      if (role == 'user') {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBar()),
          (route) => false,
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LogInScreen()),
        );
      }
    } catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LogInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("C O M I C  W O R L D")),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
