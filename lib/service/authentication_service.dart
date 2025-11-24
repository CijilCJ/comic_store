
import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationService {

  final authService =Supabase.instance.client;
  String errorMessage="";

  Future<void>signUpService(String email,dynamic password)async{
    try {
      await authService.auth.signUp(email: email,password: password);
    }on Exception catch (e) {
      log("Error Not signup please check it: $e");
      errorMessage="$e";
    }catch(e){
      log("Error Not signup please check it:$e");
    }
  }

  Future<void>signInService(String email,dynamic password)async{
    try {
      await authService.auth.signInWithPassword(email: email,password: password);
    }on Exception catch (e) {
      log("Error Not signup please check it: $e");
        errorMessage="$e";
    }catch(e){
      log("Error Not signin please check it:$e");
    }
  }

  Future<void>signOutService()async{
    try {
      await authService.auth.signOut();
    }on Exception catch (e) {
      log("Error Not sigout please check it:$e");
      errorMessage="$e";
    }catch(e){
      log("Error Not signout please check it:$e");
    }
  }

  Future<void> signInWithGoogle() async {
    try {
    await authService.auth.signInWithOAuth(OAuthProvider.google);
    }on Exception catch (e) {
    log("Error Not Google auth please check it:$e");
    errorMessage="$e";
    }catch(e){
    log("Error Not Google auth please check it:$e");
    }
  }
  Future<void> signInWithOtp(String phone) async {
    try {
     await authService.auth.signInWithOtp(phone: phone);
    }on Exception catch (e) {
     log("Error Not otp pass please check it:$e");
     errorMessage="$e";
    }catch(e){
     log("Error Not otp pass please check it:$e");
    }
  }
  Future<void> verifyOtp(String phone, String token) async {
    await Supabase.instance.client.auth.verifyOTP(
    phone: phone,
    token: token,
    type: OtpType.email,
  );
}
}