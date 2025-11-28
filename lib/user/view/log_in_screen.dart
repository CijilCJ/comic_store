
import 'dart:math';

import 'package:comic_world/user/view/bottom_nav_bar.dart';
import 'package:comic_world/user/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool obscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      
      await Supabase.instance.client.auth.signInWithPassword(
        password: passwordController.text,email: emailController.text);

      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (response.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login Successful")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => BottomNavBar()),
        );
      }else{
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text ("Please verify your email before logging in.")));
}

    } on AuthException catch (e) {
       
      if (e.message.contains("Email not confirmed")) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    }on Exception{
      if (e.toString().contains("")) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Something went wrong$e")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 25,
              children: [
                Text("Log In", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),

                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (v) => v!.isEmpty ? "Email is required" : null,
                ),

                TextFormField(
                  controller: passwordController,
                  obscureText: obscure,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: () => setState(() => obscure = !obscure),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (v) => v!.isEmpty ? "Password required" : null,
                ),

                SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text("Log In", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => SignUpScreen()),
                        );
                      },
                      child: Text("Sign Up", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}





// import 'package:comic_world/user/view/bottom_nav_bar.dart';
// import 'package:comic_world/user/view/sign_up_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class LogInScreen extends StatefulWidget {
//   const LogInScreen({super.key});

//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }

// class _LogInScreenState extends State<LogInScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   bool isLoading = false;
//   bool obscure = true;

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   bool validateEmail(String email) {
//     final emailRegex = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$');
//     return emailRegex.hasMatch(email.trim());
//   }

//   Future<void> _login() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => isLoading = true);

//     try {
//       final response = await Supabase.instance.client.auth.signInWithPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       if (response.user != null) {
//         if (!response.user!.emailConfirmedAt) {
//           ScaffoldMessenger.of(context).showSnackBar(
//              SnackBar(
//               content: Text("Login successful!"),
//               backgroundColor: Colors.green,
//             ),
//           );

//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (_) => const BottomNavBar()),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("Please verify your email before logging in."),
//               backgroundColor: Colors.orange,
//             ),
//           );
//         }
//       }

//     } on AuthException catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(e.message),
//           backgroundColor: Colors.red,
//         ),
//       );

//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Something went wrong. Please try again."),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               spacing: 25,
//               children: [
//                 const Text(
//                   "Log In",
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),

//                 TextFormField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     labelText: "Email",
//                     prefixIcon: const Icon(Icons.email),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12)),
//                   ),
//                   validator: (v) {
//                     if (v!.trim().isEmpty) return "Email is required";
//                     if (!validateEmail(v)) return "Enter valid email";
//                     return null;
//                   },
//                 ),

//                 TextFormField(
//                   controller: passwordController,
//                   obscureText: obscure,
//                   decoration: InputDecoration(
//                     labelText: "Password",
//                     prefixIcon: const Icon(Icons.lock),
//                     suffixIcon: IconButton(
//                       icon: Icon(obscure
//                           ? Icons.visibility_off
//                           : Icons.visibility),
//                       onPressed: () => setState(() => obscure = !obscure),
//                     ),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12)),
//                   ),
//                   validator: (v) =>
//                       v!.trim().isEmpty ? "Password required" : null,
//                 ),

//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: isLoading ? null : _login,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.cyan,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: isLoading
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text("Log In",
//                             style: TextStyle(
//                                 fontSize: 18, color: Colors.white)),
//                   ),
//                 ),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Don't have an account? "),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (_) => const SignUpScreen()),
//                         );
//                       },
//                       child: const Text("Sign Up",
//                           style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold)),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
