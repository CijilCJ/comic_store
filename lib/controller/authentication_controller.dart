import 'package:comic_world/service/authentication_service.dart';
import 'package:flutter/material.dart';

class AuthenticationController extends ChangeNotifier{

  AuthenticationService clientService= AuthenticationService();

  bool isLoading=false;
  String?  errorMessage;

Future<void> signUpFunction(String email, String password)async{
    try {
      isLoading=true;
      notifyListeners();
      await clientService.signUpService (email,password);
    } catch (e) {
      errorMessage = e.toString();
      
    }finally{
      isLoading=false;
      notifyListeners();
    }
  }
  Future<void> signInFunction(String email, String password)async{
    try {
      isLoading=true;
      notifyListeners();
      await clientService.signInService(email ,password);
    } catch (e) {
      errorMessage=e.toString();
    }finally{
      isLoading=false;
      notifyListeners();
    }
  }

  Future<void>signoutFunction()async{
    isLoading=true;
      notifyListeners();
    try {
      await clientService.signOutService();
    } catch (e) {
      errorMessage = e.toString();
    }finally{
      isLoading=false;
      notifyListeners();
    }
  }
  Future<void> googleAuth(BuildContext context)async{
    isLoading = true;
    notifyListeners();
    try {
      await clientService.signInWithGoogle();
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google Sign-In failed: $e')),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> sendOtp(String phone, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      await clientService.signInWithOtp(phone);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP sent to $phone')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.toString())),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void>verifyOTP(String phone,BuildContext context,String token)async{
    try {
      await clientService.verifyOtp(phone, token);
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP verification failed: $e')),
      );
    }
  }

}