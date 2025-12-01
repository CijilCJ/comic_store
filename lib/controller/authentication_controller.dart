import 'dart:developer';

import 'package:comic_world/user/service/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationController extends ChangeNotifier {
  AuthenticationService clientService = AuthenticationService();

  bool isLoading = false;
  String? errorMessage;

  // Future<bool> signUpFunction(String email, String password)async{
  //   _start();
  //     try {
  //       await clientService.signUpService (email,password);
  //       errorMessage= clientService.errorMessage;
  //       return errorMessage==null;
  //     } catch (e) {
  //       errorMessage = e.toString();
  //       errorMessage = "Something went wrong. Try again.";
  //       return false;
  //     }finally{
  //       _finish();
  //     }
  //   }

  Future<bool> signUpFunction(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      errorMessage = null;
      await clientService.signUpService(email, password);
      return true;
    // } on AuthException catch (e) {
    //   if (e.message==400) {
    //     errorMessage="";
    //   }
    //   print(errorMessage = clientService.errorMessage);
    //   log("AuthException error  $e.Try again");
    //   return false;
    // } on PostgrestException catch (e) {
    //   if (e.message==400) {
    //     errorMessage="";
    //   }
    //   log("PostgrestException error  $e.Try again");
    //   print(errorMessage = clientService.errorMessage);
    //   return false;
    } on Exception catch (e) {
      if (e.toString()==400) {
        errorMessage="";
      }
      log("Exception error  $e.Try again");
      print(errorMessage = clientService.errorMessage);
      return false;
    } catch (e) {
      if (e.toString()==400) {
        errorMessage="";
      }
      log("Something went wrong  $e. Try again.");
      print(errorMessage = clientService.errorMessage);
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Future<bool> signInFunction(String email, String password)async{
  //   _start();
  //   try {
  //     await clientService.signInService(email ,password);
  //     errorMessage = clientService.errorMessage;
  //     return errorMessage == null;
  //   } catch (e) {
  //    errorMessage = "Unexpected error occurred.";
  //     return false;
  //   }finally{
  //     _finish();
  //   }
  // }

  Future<bool> signInFunction(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      errorMessage = null;
      await clientService.signInService(email, password);
      return true;
    // } on AuthException catch (e) {
    //   errorMessage = e.message;
    //   print("AuthException error .Try again $e");
    //   print(errorMessage = clientService.errorMessage);
    //   return false;
    // } on PostgrestException catch (e) {
    //   errorMessage = e.message;
    //   print("PostgrestException error  $e .Try again");
    //   print(errorMessage = clientService.errorMessage);
    //   return false;
    } on Exception catch (e) {
      errorMessage = e.toString();
      print("Exception error  $e.Try again");
      print(errorMessage = clientService.errorMessage);
      return false;
    } catch (e) {
      errorMessage = e.toString();
      print("Something went wrong  $e. Try again.");
      print(errorMessage = clientService.errorMessage);
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Future<bool>signoutFunction()async{
  //   _start();
  //   try {
  //     await clientService.signOutService();
  //     errorMessage = clientService.errorMessage;
  //     return errorMessage == null;
  //   } catch (e) {
  //     errorMessage = "Logout failed. Try again.";
  //     return false;
  //   }finally{
  //     _finish();
  //   }
  // }

  Future<bool> signOutFunction() async {
    try {
      isLoading = true;
      notifyListeners();
      errorMessage = null;
      await clientService.signOutService();
      return true;
    } on AuthException catch (e) {
      errorMessage = e.message;
      print("AuthException error .Try again $e");
      print(errorMessage = clientService.errorMessage);
      return false;
    } on PostgrestException catch (e) {
      errorMessage = e.message;
      print("PostgrestException error  $e .Try again");
      print(errorMessage = clientService.errorMessage);
      return false;
    } on Exception catch (e) {
      errorMessage = e.toString();
      print("Exception error  $e.Try again");
      print(errorMessage = clientService.errorMessage);
      return false;
    } catch (e) {
      errorMessage = e.toString();
      print("Logout failed. Try again.  $e. Try again.");
      print(errorMessage = clientService.errorMessage);
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Future<void> googleAuth(BuildContext context)async{
  //   _start();
  //   try {
  //     await clientService.signInWithGoogle();
  //     Navigator.pushReplacementNamed(context, '/home');
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Google Sign-In failed: $e')),
  //     );
  //   } finally {
  //      _finish();
  //   }
  // }

  Future<bool> googleAuth(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      errorMessage = null;
      await clientService.signInWithGoogle();
      return true;
    } on AuthException catch (e) {
      errorMessage = e.message;
      print("AuthException error .Try again $e");
      print(errorMessage = clientService.errorMessage);
      return false;
    } on PostgrestException catch (e) {
      errorMessage = e.message;
      print("PostgrestException error  $e .Try again");
      print(errorMessage = clientService.errorMessage);
      return false;
    } on Exception catch (e) {
      errorMessage = e.toString();
      print("Exception error  $e.Try again");
      print(errorMessage = clientService.errorMessage);
      return false;
    } catch (e) {
      errorMessage = e.toString();
      print("Google Sign-In failed:$e. Try again.");
      print(errorMessage = clientService.errorMessage);
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> sendOtp(String phone, BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      errorMessage = null;
      await clientService.signInWithOtp(phone);
      return true;
    } on AuthException catch (e) {
      errorMessage = e.message;
      print("AuthException error .Try again $e");
      print(errorMessage = clientService.errorMessage);
      return false;
    } on PostgrestException catch (e) {
      errorMessage = e.message;
      print("PostgrestException error  $e .Try again");
      print(errorMessage = clientService.errorMessage);
      return false;
    } on Exception catch (e) {
      errorMessage = e.toString();
      print("Exception error  $e.Try again");
      print(errorMessage = clientService.errorMessage);
      return false;
    } catch (e) {
      errorMessage = e.toString();
      print("Google Sign-In failed:$e. Try again.");
      print(errorMessage = clientService.errorMessage);
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Future<bool>verifyOTP(String phone,BuildContext context,String token)async{
  //   try {
  //     await clientService.verifyOtp(phone, token);
  //     errorMessage = clientService.errorMessage;
  //     return errorMessage == null;
  //   } catch (e) {
  //     errorMessage = "Invalid OTP. Try again.";
  //     return false;
  //   }
  // }

  Future<bool> verifyOTP(
    String phone,
    BuildContext context,
    String token,
  ) async {
    try {
      isLoading = true;
      notifyListeners();
      errorMessage = null;
      await clientService.verifyOtp(phone, token);
      return true;
    } on AuthException catch (e) {
      errorMessage = e.message;
      print("AuthException error .Try again $e");
      print(errorMessage = clientService.errorMessage);
      return false;
    } on PostgrestException catch (e) {
      errorMessage = e.message;
      print("PostgrestException error  $e .Try again");
      print(errorMessage = clientService.errorMessage);
      return false;
    } on Exception catch (e) {
      errorMessage = e.toString();
      print("Exception error  $e.Try again");
      print(errorMessage = clientService.errorMessage);
      return false;
    } catch (e) {
      errorMessage = e.toString();
      print("Invalid OTP $e. Try again.");
      print(errorMessage = clientService.errorMessage);
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}






// controller=>                                                                 import 'package:flutter/material.dart';
// import 'package:supabase_practice/service/auth_sevice.dart';

// class AuthController extends ChangeNotifier {
//   final AuthService service = AuthService();

//   bool isLoading = false;
//   String? errorMsg;

//   Future<bool> login(String email, String password) async {
//     try {
//       isLoading = true;
//       errorMsg = null;
//       notifyListeners();

//       await service.signin(email, password);
//       return true;
//     } catch (e) {
//       errorMsg = e.toString();
//       return false;
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<bool> register(String email, String password) async {
//     try {
//       isLoading = true;
//       errorMsg = null;
//       notifyListeners();

//       await service.signup(email, password);
//       return true;
//     } catch (e) {
//       errorMsg = e.toString();
//       return false;
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }