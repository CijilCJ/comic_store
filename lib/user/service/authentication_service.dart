import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationService {
  final authService = Supabase.instance.client;
  String? errorMessage ;

  // Future<void> signUpService(String email, String password) async {
  //   try {
  //     await authService.auth.signUp(email: email, password: password);
  //   } on AuthException catch (e) {
  //     log("AuthException: ${e.message}");
  //     errorMessage = e.message;
  //   } on PostgrestException catch (e) {
  //     errorMessage = e.message;
  //     log("postgrest exception: ${e.message}");
  //   } on Exception catch (e) {
  //     errorMessage = e.toString();
  //     log("Exception: $e");
  //   } catch (e) {
  //     errorMessage = e.toString();
  //     log("unknwon: $e");
  //   }
  // }

  Future <void> signUpService(String email,String password)async{
    try {
      await authService.auth.signUp(password: password,email: email);
    }on AuthException catch (e) {
      errorMessage=e.message;
    } on PostgrestException catch (e){
      errorMessage=e.message;
    }on Exception catch(e){
      errorMessage=e.toString();
    }catch (e){
      errorMessage=e.toString();
    }
  }

  // Future<void> signInService(String email, String password) async {
  //   try {
  //     await authService.auth.signInWithPassword(
  //       email: email,
  //       password: password,
  //     );
  //   } on AuthException catch (e) {
  //     log("Auth exception: $e");
  //     errorMessage = e.message;
  //   } on PostgrestException catch (e) {
  //     errorMessage = e.message;
  //     log("postgrest Exception: ${e.message}");
  //   } on Exception catch (e) {
  //     errorMessage = e.toString();
  //     log("Exception: $e");
  //   } catch (e) {
  //     errorMessage = e.toString();
  //     log("unknwon: $e");
  //   }
  // }

  Future <void> signInService(String email, String password)async{
    try {
      await authService.auth.signInWithPassword(email: email, password: password);
    }on AuthException catch (e) {
      errorMessage = e.message;
      log(e.message);
    }on PostgrestException catch(e){
      errorMessage = e.message;
       log(e.message);
    }on Exception catch (e){
      errorMessage = e.toString();
       log(e.toString());
    }catch(e){
      errorMessage=e.toString();
       log(e.toString());
    }
  }

  Future<void> signOutService() async {
    try {
      await authService.auth.signOut();
    } on AuthException catch (e) {
      errorMessage = e.message;
    } on PostgrestException catch (e) {
      errorMessage = e.message;
    } on Exception catch (e) {
      errorMessage = e.toString();
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await authService.auth.signInWithOAuth(OAuthProvider.google);
    } on AuthException catch (e) {
      errorMessage = e.message;
    } on PostgrestException catch (e) {
      errorMessage = e.message;
    } on Exception catch (e) {
      errorMessage = e.toString();
    } catch (e) {
      log("Unknwon:$e");
    }
  }

  Future<void> signInWithOtp(String phone) async {
    try {
      await authService.auth.signInWithOtp(phone: phone);
    } on AuthException catch (e) {  
      errorMessage = e.message;
    } on PostgrestException catch (e) {
      errorMessage = e.message;
    } on Exception catch (e) {
      errorMessage = e.toString();
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  Future<void> verifyOtp(String phone, String token) async {
    try{
    await authService.auth.verifyOTP(
      phone: phone,
      token: token,
      type: OtpType.sms,
    );
    }on AuthException catch (e) {
      errorMessage = e.message;
    } on PostgrestException catch (e) {
      errorMessage = e.message;
    } on Exception catch (e) {
      errorMessage = e.toString();
    } catch (e) {
      errorMessage = e.toString();

    }
  }
}







// service =>                                                                      import 'package:supabase_flutter/supabase_flutter.dart';

// class AuthService {
//   final  supabase = Supabase.instance.client;

//   Future<void> signup(String email, String password) async {
//     await supabase.auth.signUp(
//       email: email,
//       password: password,
//     );
//   }

//   Future<void> signin(String email, String password) async {
//     await supabase.auth.signInWithPassword(
//       email: email,
//       password: password,
//     );
//   }
// }