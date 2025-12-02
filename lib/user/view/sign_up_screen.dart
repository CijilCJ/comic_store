// import 'package:comic_world/controller/authentication_controller.dart';
// import 'package:comic_world/user/view/bottom_nav_bar.dart';
// import 'package:comic_world/user/view/log_in_screen.dart';
// import 'package:comic_world/user/widgets/textfield.dart';
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

//   Future<void> _signUp() async {
//   if (!_formKey.currentState!.validate()) return;

//   setState(() => isLoading = true);

//   try {
//     final response = await Supabase.instance.client.auth.signUp(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//       data: {
//         "username": userNameController.text.trim(),
//         "phone": phoneController.text.trim(),
//         "role": "user",
//       },
//     );

//     if (response.user != null) {
//       if (response.user!.identities!.isEmpty) {
//         // user exists already
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("User already exists. Try login.")),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Account created! Please verify your email.")),
//         );
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => LogInScreen()),
//         );
//       }
//     }
//   } on AuthException catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(e.message)),
//     );
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Something went wrong. Try again.")),
//     );
//   } finally {
//     setState(() => isLoading = false);
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<AuthenticationController>(context);
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             SizedBox(height: 60),
//             Text(
//               "Create Account",
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 30),
//             Form(
//               key: _formKey,
//               child: Column(
//                 spacing: 20,
//                 children: [
//                   TextFormField(
//                     controller: userNameController,
//                     decoration: InputDecoration(
//                       labelText: "Username",
//                       prefixIcon: Icon(Icons.person),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     validator: (v) => v!.isEmpty ? "Required" : null,
//                   ),
//                   // TextFormField(
//                   //   controller: emailController,
//                   //   decoration: InputDecoration(
//                   //     labelText: "Email",
//                   //     prefixIcon: Icon(Icons.email),
//                   //     border: OutlineInputBorder(
//                   //       borderRadius: BorderRadius.circular(12),
//                   //     ),
//                   //   ),
//                   //   validator: (v) {
//                       // if (v!.trim().isEmpty) return "Email is required";
//                       // final emailRegex = RegExp(r'@gmail.com');
//                       // return emailRegex.hasMatch(v.trim())
//                       //     ? null
//                       //     : "Enter a valid email (example@gmail.com)";
//                   //   },
//                   // ),

//                   textFormField(emailController, "Email", Icons.email, (value){
//                     if (value!.trim().isEmpty) return "Email is required";
//                       final emailRegex = RegExp(r'@gmail.com');
//                       return emailRegex.hasMatch(value.trim())
//                           ? null
//                           : "Enter a valid email (example@gmail.com)";
//                   }),

//                   TextFormField(
//                     controller: phoneController,
//                     decoration: InputDecoration(
//                       labelText: "Phone",
//                       prefixIcon: Icon(Icons.phone),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     validator:
//                         (v) =>
//                             v!.trim().isEmpty
//                                 ? "Phone number required"
//                                 : !validatePhone(v.trim())
//                                 ? "Enter valid phone (Ex: +91XXXXXXXXXX)"
//                                 : null,
//                   ),
//                   // textFormField(phoneController, "phone", Icons.phone, (v){ v!.trim().isEmpty
//                   //               ? "Phone number required"
//                   //               : !validatePhone(v.trim())
//                   //               ? "Enter valid phone (Ex: +91XXXXXXXXXX)"
//                   //               : null;}),
//                   TextFormField(
//                     controller: passwordController,
//                     obscureText: obscure,
//                     decoration: InputDecoration(
//                       labelText: "Password",
//                       prefixIcon: Icon(Icons.lock),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           obscure ? Icons.visibility_off : Icons.visibility,
//                         ),
//                         onPressed: () => setState(() => obscure = !obscure),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     validator:
//                         (v) =>
//                             v!.length < 6
//                                 ? "Password must be at least 6 characters"
//                                 : null,
//                   ),
//                   // textFormField(passwordController, "Password", Icons.lock, (v){
//                   //   v!.length < 6
//                   //   ? "Password must be at least 6 characters"
//                   //   : null;}),
//                   TextFormField(
//                     controller: confirmPasswordController,
//                     obscureText: obscure,
//                     decoration: InputDecoration(
//                       labelText: "Confirm password",
//                       prefixIcon: Icon(Icons.lock),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     validator:
//                         (v) =>
//                             v != passwordController.text
//                                 ? "Passwords do not match"
//                                 : null,
//                   ),

//                   // textFormField(confirmPasswordController, "Confirm password", Icons.lock,(v){v != passwordController.text
//                   //               ? "Passwords do not match"
//                   //               : null;}),

//                   SizedBox(height: 20),
//                   // ElevatedButton(
//                   //   onPressed: isLoading ? null : _signUp,
//                   //   child:
//                   //       isLoading
//                   //           ? CircularProgressIndicator()
//                   //           : Text("Sign Up"),
//                   // ),
//                   SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: isLoading ? null : _signUp,
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
//                 ],
//               ),
//             ),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Already have an account?"),
//                 TextButton(
//                   onPressed:
//                       () => Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (_) => LogInScreen()),
//                       ),
//                   child: Text("Login"),
//                 ),
//               ],
//             ),
//             GestureDetector(
//               onTap: () async {
//                 final authProvider = Provider.of<AuthenticationController>(
//                   context,
//                   listen: false,
//                 );
//                 await authProvider.googleAuth(context);
//                 if (authProvider != null) {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (_) => BottomNavBar()),
//                   );
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text(authProvider.errorMessage!)),
//                   );
//                 }
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.blue, width: 2),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(Icons.g_mobiledata),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   bool validatePhone(String phone) {
//     final phonePattern = RegExp(r'^\+?[0-9]{10,15}$');
//     return phonePattern.hasMatch(phone);
//   }

//   Future<void> signUp() async {
//     if (_formKey.currentState!.validate()) return;
//     if (passwordController.text.trim() !=
//         confirmPasswordController.text.trim()) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("Passwords do not match")));
//     }
//     setState(() => isLoading = true);

//   }
// }
//   try {
//     final response = Supabase.instance.client.auth.signInWithPassword(password: passwordController.text.trim(),email: emailController.text);
//     if (response.user != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Account created! Please verify your email.")),
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => LogInScreen()),
//       );

//   } catch (e) {

//   }
// }

// Future<void> _signUp() async {
//     final response =await Supabase.instance.client.auth.signUp(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//     );
//     if (response.user != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Account created! Please verify your email.")),
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => LogInScreen()),
//       );
//     }
//   }
//   try {
//     final response = await Supabase.instance.client.auth.signUp(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//       data: {
//         "username": userNameController.text.trim(),
//         "phone": phoneController.text.trim(),
//         "role": "user",
//       },
//     );
//     if (response.user != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Account created! Please verify your email.")),
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => LogInScreen()),
//       );
//     }
//   } on AuthException catch (e) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text(e.message)));
//   } finally {
//     setState(() => isLoading = false);
//   }

// Sign Up =>
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../controller/auth_controller.dart';

// class SignUpPage extends StatelessWidget {
//   SignUpPage({super.key});

//   final emailCtrl = TextEditingController();
//   final passCtrl = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final auth = Provider.of<AuthController>(context);

//     return Scaffold(
//       appBar: AppBar(title: Text("Sign Up")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [

//             TextField(
//               controller: emailCtrl,
//               decoration: InputDecoration(
//                 labelText: "Email",
//                 border: OutlineInputBorder(),
//               ),
//             ),

//             SizedBox(height: 12),

//             TextField(
//               controller: passCtrl,
//               decoration: InputDecoration(
//                 labelText: "Password",
//                 border: OutlineInputBorder(),
//               ),
//               obscureText: true,
//             ),

//             SizedBox(height: 20),

//             auth.isLoading
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: () async {
//                       bool success = await auth.register(
//                         emailCtrl.text.trim(),
//                         passCtrl.text.trim(),
//                       );

//                       if (success) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text("Account Created")),
//                         );

//                         Navigator.pop(context);
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text(auth.errorMsg ?? "Failed")),
//                         );
//                       }
//                     },
//                     child: Text("Create Account"),
//                   )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:comic_world/controller/authentication_controller.dart';
import 'package:comic_world/user/view/bottom_nav_bar.dart';
import 'package:comic_world/user/view/log_in_screen.dart';
import 'package:comic_world/user/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoading = false;
  bool obscure = true;
  bool obscureConfirmPass = true;

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool validatePhone(String phone) {
    final phonePattern = RegExp(r'^\+?[0-9]{10,15}$');
    return phonePattern.hasMatch(phone);
  }

  Future<void>_signUp()async{

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            Text(
              "Create Account",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Form(
              child: Column(
                spacing: 30,
                children: [
                  TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (v) => v!.isEmpty ? "Required" : null,
                  ),

                  textFormField(emailController, "Email", Icons.email, (value) {
                    if (value!.trim().isEmpty) return "Email is required";
                    final emailRegex = RegExp(r'@gmail.com');
                    return emailRegex.hasMatch(value.trim())
                        ? null
                        : "Enter a valid email (example@gmail.com)";
                  }),

                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: "Phone",
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator:
                        (v) =>
                            v!.trim().isEmpty
                                ? "Phone number required"
                                : validatePhone(v.trim())
                                ? "Enter valid phone (Ex: +91XXXXXXXXXX)"
                                : null,
                  ),

                  TextFormField(
                    controller: passwordController,
                    obscureText: obscure,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () => setState(() => obscure = !obscure),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator:
                        (v) =>
                            v!.length < 6
                                ? "Password must be at least 6 characters"
                                : null,
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: obscure,
                    decoration: InputDecoration(
                      labelText: "Confirm password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator:
                        (v) =>
                            v != passwordController.text
                                ? "Passwords do not match"
                                : null,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child:
                          isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                "Log In",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed:
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => LogInScreen()),
                      ),
                  child: Text("Login"),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                final authProvider = Provider.of<AuthenticationController>(
                  context,
                  listen: false,
                );
                await authProvider.googleAuth(context);
                if (authProvider != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => BottomNavBar()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(authProvider.errorMessage!)),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.g_mobiledata),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
