// import 'dart:math';

// import 'package:comic_world/controller/authentication_controller.dart';
// import 'package:comic_world/user/view/bottom_nav_bar.dart';
// import 'package:comic_world/user/view/sign_up_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
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

//   Future<void> _login() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => isLoading = true);

//     try {
//       await Supabase.instance.client.auth.signInWithPassword(
//         password: passwordController.text,
//         email: emailController.text,
//       );

//       final response = await Supabase.instance.client.auth.signInWithPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       if (response.user != null) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text("Login Successful")));

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => BottomNavBar()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("Please verify your email before logging in."),
//           ),
//         );
//       }
//     } on AuthException catch (e) {
//       if (e.message.contains("Email not confirmed")) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text(e.message)));
//       } else {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text(e.message)));
//       }
//     } on Exception {
//       if (e.toString().contains("")) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text(e.toString())));
//       } else {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text(e.toString())));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("Something went wrong$e")));
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(20),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               spacing: 25,
//               children: [
//                 Text(
//                   "Log In",
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),

//                 TextFormField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     labelText: "Email",
//                     prefixIcon: Icon(Icons.email),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   validator: (v) => v!.isEmpty ? "Email is required" : null,
//                 ),

//                 TextFormField(
//                   controller: passwordController,
//                   obscureText: obscure,
//                   decoration: InputDecoration(
//                     labelText: "Password",
//                     prefixIcon: Icon(Icons.lock),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         obscure ? Icons.visibility_off : Icons.visibility,
//                       ),
//                       onPressed: () => setState(() => obscure = !obscure),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   validator: (v) => v!.isEmpty ? "Password required" : null,
//                 ),

//                 SizedBox(height: 10),

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
//                     child:
//                         isLoading
//                             ? CircularProgressIndicator(color: Colors.white)
//                             : Text(
//                               "Log In",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.white,
//                               ),
//                             ),
//                   ),
//                 ),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Don't have an account? "),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (_) => SignUpScreen()),
//                         );
//                       },
//                       child: Text(
//                         "Sign Up",
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 GestureDetector(
//                   onTap: () async {
//                     final authProvider = Provider.of<AuthenticationController>(
//                       context,
//                       listen: false,
//                     );
//                     await authProvider.googleAuth(context);
//                     if (authProvider != null) {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (_) => BottomNavBar()),
//                       );
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text(authProvider.errorMessage!)),
//                       );
//                     }
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.blue, width: 2),
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(Icons.g_mobiledata),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






// import 'package:comic_world/controller/authentication_controller.dart';
// import 'package:comic_world/user/view/bottom_nav_bar.dart';
// import 'package:comic_world/user/view/log_in_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final userNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   bool isLoading = false;
//   bool obscure = true;
//   bool obscureConfirmPass = true;
  
//   @override
//   void dispose() {
//     userNameController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }

//     bool validatePhone(String phone) {
//     final phonePattern = RegExp(r'^\+?[0-9]{10,15}$');  
//     return phonePattern.hasMatch(phone);
//   }

//   Future<void> _signUp() async {
//     if (!_formKey.currentState!.validate()) return;

//     if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Passwords do not match")),
//       );
//       return;
//     }

//     setState(() => isLoading = true);

//     try {
//       final response = await Supabase.instance.client.auth.signUp(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//         data: {
//           "username": userNameController.text.trim(),
//           "phone": phoneController.text.trim(),
//           "role": "user",
//         },
//       );

//       if (response.user != null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Account created! Please verify your email.")),
//         );

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => LogInScreen()),
//         );
//       }
//     } on AuthException catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.message)),
//       );
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             SizedBox(height: 60),
//             Text("Create Account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//             SizedBox(height: 30),

//             Form(
//               key: _formKey,
//               child: Column(
//                 spacing: 18,
//                 children: [
//                   TextFormField(
//                     controller: userNameController,
//                     decoration: InputDecoration(labelText: "Username", prefixIcon: Icon(Icons.person),border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),),
//                     validator: (v) => v!.isEmpty ? "Required" : null,
//                   ),
//                   TextFormField(
//                     controller: emailController,
//                     decoration: InputDecoration(labelText: "Email", prefixIcon: Icon(Icons.email),border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),),
//                     validator: (v) {
//                       if (v!.trim().isEmpty) return "Email is required";
//                       final emailRegex = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$');
//                       return emailRegex.hasMatch(v.trim())
//                           ? null
//                           : "Enter a valid email (example@gmail.com)";
//                     },
//                   ),
//                   TextFormField(
//                     controller: phoneController,
//                     decoration: InputDecoration(labelText: "Phone", prefixIcon: Icon(Icons.phone),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),),
//                     validator: (v) => v!.trim().isEmpty
//                         ? "Phone number required"
//                         : !validatePhone(v.trim())
//                             ? "Enter valid phone (Ex: +91XXXXXXXXXX)"
//                             : null,
//                   ),
//                   TextFormField(
//                     controller: passwordController,
//                     obscureText: obscure,
//                     decoration: InputDecoration(
//                       labelText: "Password",
//                       prefixIcon: Icon(Icons.lock),
//                       suffixIcon: IconButton(
//                         icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
//                         onPressed: () => setState(() => obscure = !obscure),
//                       ),
//                       border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     ),
//                     validator: (v) =>
//                         v!.length < 6 ? "Password must be at least 6 characters" : null,
//                   ),
//                   TextFormField(
//                     controller: confirmPasswordController,
//                     obscureText: obscure,
//                     decoration: InputDecoration(labelText: "Confirm password", prefixIcon: Icon(Icons.lock),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),),
//                     validator: (v) => v != passwordController.text
//                       ? "Passwords do not match"
//                       : null,
//                   ),

//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: isLoading ? null : _signUp,
//                     child: isLoading
//                         ? CircularProgressIndicator(color: Colors.white)
//                         : Text("Sign Up"),
//                   ),
//                 ],
//               ),
//             ),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Already have an account?"),
//                 TextButton(
//                   onPressed: () => Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (_) => LogInScreen()),
//                   ),
//                   child: Text("Login"),
//                 )
//               ],
//             ),
//             GestureDetector(
//                     onTap: () async{
//                           final authProvider = Provider.of<AuthenticationController>(context, listen: false);
//                            await authProvider.googleAuth(context);
//                              if (authProvider != null) {
//                                 Navigator.pushReplacement( context,
//                                 MaterialPageRoute(builder: (_) => BottomNavBar()),
//                                );
//                              } else {
//                            ScaffoldMessenger.of(context).showSnackBar(
//                                SnackBar(content: Text(authProvider.errorMessage!)),
//                                );
//                             }
//                               },
//                             child: Container(
//                                 padding: const EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                border: Border.all(color: Colors.blue, width: 2),
//                                  shape: BoxShape.circle,
//                               ),
//                           child: Icon(Icons.g_mobiledata),
//                            ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



