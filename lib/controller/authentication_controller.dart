import 'dart:math';

import 'package:comic_world/user/service/authentication_service.dart';
import 'package:flutter/material.dart';

class AuthenticationController extends ChangeNotifier{

  AuthenticationService clientService= AuthenticationService();

  bool isLoading=false;
  String?  errorMessage;

  void _start() {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
  }

  void _finish() {
    isLoading = false;
    notifyListeners();
  }

Future<bool> signUpFunction(String email, String password)async{
  _start();
    try {
      await clientService.signUpService (email,password);
      errorMessage= clientService.errorMessage;
      return errorMessage==null;
    } catch (e) {
      errorMessage = e.toString();
      errorMessage = "Something went wrong. Try again.";
      return false;
    }finally{
      _finish();
    }
  }
  Future<bool> signInFunction(String email, String password)async{
    _start();
    try {
      await clientService.signInService(email ,password);
      errorMessage = clientService.errorMessage;
      return errorMessage == null;
    } catch (e) {
     errorMessage = "Unexpected error occurred.";
      return false;
    }finally{
      _finish();
    }
  }

  Future<bool>signoutFunction()async{
    _start();
    try {
      await clientService.signOutService();
      errorMessage = clientService.errorMessage;
      return errorMessage == null;
    } catch (e) {
      errorMessage = "Logout failed. Try again.";
      return false;
    }finally{
      _finish();
    }
  }
  Future<void> googleAuth(BuildContext context)async{
    _start();
    try {
      await clientService.signInWithGoogle();
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google Sign-In failed: $e')),
      );
    } finally {
       _finish();
    }
  }

  Future<bool> sendOtp(String phone, BuildContext context) async {
   _start();

    try {
      await clientService.signInWithOtp(phone);
      errorMessage = clientService.errorMessage;
      return errorMessage == null;
    } catch (e) {
      errorMessage = "Failed to send OTP.";
      return false;
    } finally {
     _finish();
    }
  }

  Future<bool>verifyOTP(String phone,BuildContext context,String token)async{
    try {
      await clientService.verifyOtp(phone, token);
      errorMessage = clientService.errorMessage;
      return errorMessage == null;
    } catch (e) {
      errorMessage = "Invalid OTP. Try again.";
      return false;
    }
  }

}