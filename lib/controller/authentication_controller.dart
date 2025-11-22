
// import 'package:comic_world/service/authentication_service.dart';
// import 'package:flutter/material.dart';

// class AuthenticationController extends ChangeNotifier{

//   AuthenticationService authService=AuthenticationService();
//   bool isLoading = false;
//   String? errorMessage;

//   Future<void> signupFunction(String email, String password)async{
//     try {
//       isLoading=true;
//       notifyListeners();
//       await authService.signupService (email,password);
//     } catch (e) {
//       errorMessage="Not SignUp please check the email or password$e";
//     }finally{
//       isLoading=false;
//       notifyListeners();
//     }
//   }

//   Future<void> signinFunction(String email, String password)async{
//     try {
//       isLoading=true;
//       notifyListeners();
//       await authService.signinService(email ,password);
//     } catch (e) {
//       errorMessage="Not Signin please check the email or password$e";
//     }finally{
//       isLoading=false;
//       notifyListeners();
//     }
//   }

//    Future<void> sendOtp(String phone, BuildContext context) async {
//     isLoading = true;
//     notifyListeners();

//     try {
//       await authService.signInWithOtp(phone);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('OTP sent to $phone')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error: $e')),
//       );
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void>verifyOTP(String phone,BuildContext context,String token)async{
//     try {
//       await authService.verifyOtp(phone, token);
//       Navigator.pushReplacementNamed(context, '/home');
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('OTP verification failed: $e')),
//       );
//     }
//   }

//   Future<void> googleAuth(BuildContext context)async{
//     isLoading = true;
//     notifyListeners();
//     try {
//       await authService.signInWithGoogle();
//       Navigator.pushReplacementNamed(context, '/home');
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Google Sign-In failed: $e')),
//       );
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void>signoutFunction()async{
//     try {
//       isLoading=true;
//       notifyListeners();
//       await authService.signoutService();
//     } catch (e) {
//       errorMessage="Not Signout please check $e";
//     }finally{
//       isLoading=false;
//       notifyListeners();
//     }
//   }

// }


import 'package:comic_world/service/authentication_service.dart';
import 'package:flutter/material.dart';

class AuthenticationController extends ChangeNotifier{

  AuthenticationService clientService= AuthenticationService();

  bool isLoading=false;
  String errorMessage="";

Future<void> signUpFunction(String email, String password)async{
    try {
      isLoading=true;
      notifyListeners();
      await clientService.signUpService (email,password);
    } catch (e) {
      if (e==400) {
        errorMessage="";
      }else if(e==200){
        errorMessage="";
      }else if(e==404){
        errorMessage="";
      }else if(e==401){
        errorMessage="";
      }else if(e==403){
        errorMessage="";
      }else if(e==202){
        errorMessage="";
      }
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
      if (e==400) {
        errorMessage="";
      }else if(e==200){
        errorMessage="";
      }else if(e==404){
        errorMessage="";
      }else if(e==401){
        errorMessage="";
      }else if(e==403){
        errorMessage="";
      }else if(e==202){
        errorMessage="";
      }
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
      if (e==400) {
        errorMessage="";
      }else if(e==200){
        errorMessage="";
      }else if(e==404){
        errorMessage="";
      }else if(e==401){
        errorMessage="";
      }else if(e==403){
        errorMessage="";
      }else if(e==202){
        errorMessage="";
      }
      // errorMessage="Not Signout please check $e";
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
      SnackBar(content: Text('Error: $e')),
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