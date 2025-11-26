import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationService {
  final authService = Supabase.instance.client;
  String? errorMessage ;

  Future<void> signUpService(String email, String password) async {
    try {
      await authService.auth.signUp(email: email, password: password);
    } on AuthException catch (e) {
      log("AuthException: ${e.message}");
      errorMessage = e.message;
    } on PostgrestException catch (e) {
      errorMessage = e.message;
      log("postgrest exception: ${e.message}");
    } on Exception catch (e) {
      errorMessage = e.toString();
      log("Exception: $e");
    } catch (e) {
      errorMessage = e.toString();
      log("unknwon: $e");
    }
  }

  Future<void> signInService(String email, String password) async {
    try {
      await authService.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      log("Auth exception: $e");
      errorMessage = e.message;
    } on PostgrestException catch (e) {
      errorMessage = e.message;
      log("postgrest Exception: ${e.message}");
    } on Exception catch (e) {
      errorMessage = e.toString();
      log("Exception: $e");
    } catch (e) {
      errorMessage = e.toString();
      log("unknwon: $e");
    }
  }

  Future<void> signOutService() async {
    try {
      await authService.auth.signOut();
    } on AuthException catch (e) {
      log("Auth Exception:$e");
      errorMessage = e.message;
    } on PostgrestException catch (e) {
      errorMessage = e.message;
      log("postgrest exception: ${e.message}");
    } on Exception catch (e) {
      errorMessage = e.toString();
      log("Exception: $e");
    } catch (e) {
      errorMessage = e.toString();
      log("unknwon: $e");
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await authService.auth.signInWithOAuth(OAuthProvider.google);
    } on AuthException catch (e) {
      log("auth exception:$e");
      errorMessage = e.message;
    } on PostgrestException catch (e) {
      errorMessage = e.message;
      log("postgrest exception: ${e.message}");
    } on Exception catch (e) {
      errorMessage = e.toString();
      log("Exception: $e");
    } catch (e) {
      log("Unknwon:$e");
      errorMessage = e.toString();
    }
  }

  Future<void> signInWithOtp(String phone) async {
    try {
      await authService.auth.signInWithOtp(phone: phone);
    } on AuthException catch (e) {
      log("AuthException:$e");
      errorMessage = e.message;
    } on PostgrestException catch (e) {
      errorMessage = e.message;
      log("postgrest Exception: ${e.message}");
    } on Exception catch (e) {
      errorMessage = e.toString();
      log("Exception: $e");
    } catch (e) {
      errorMessage = e.toString();
      log("unknown: $e");
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
      log("AuthException:$e");
      errorMessage = e.message;
    } on PostgrestException catch (e) {
      errorMessage = e.message;
      log("postgrest Exception: ${e.message}");
    } on Exception catch (e) {
      errorMessage = e.toString();
      log("Exception: $e");
    } catch (e) {
      errorMessage = e.toString();
      log("unknown: $e");
    }
  }
}
