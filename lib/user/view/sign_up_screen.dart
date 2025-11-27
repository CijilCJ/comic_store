// // import 'package:comic_world/user/view/log_in_screen.dart';
// // import 'package:comic_world/user/view/otp_verify_screen.dart';
// // import 'package:comic_world/user/widgets/textfield.dart';
// // import 'package:flutter/material.dart';
// // import 'package:supabase_flutter/supabase_flutter.dart';

// // class SignUpScreen extends StatefulWidget {
// //   const SignUpScreen({super.key});

// //   @override
// //   State<SignUpScreen> createState() => _SignUpScreenState();
// // }

// // class _SignUpScreenState extends State<SignUpScreen> {
// //   final emailControll = TextEditingController();
// //   final passWordControll = TextEditingController();
// //   final userNameControll = TextEditingController();
// //   final phoneNumberController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     // final provider=Provider.of<AuthenticationController>(context);
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         scrollDirection: Axis.vertical,
// //         child: Column(
// //           spacing: 30,
// //           children: [
// //             Text("SignUp"),
// //             Text("Welcome to Comic book world"),
// //             Form(
// //               child: Column(
// //                 spacing: 20,
// //                 children: [
// //                   textField(
// //                     userNameControll,
// //                     "UserName",
// //                     "hint",
// //                     Icons.person,
// //                     () {},
// //                   ),
// //                   textField(emailControll, "email", "hint", Icons.mail,
// //                   (value) {
// //                       if (value == null || value.isEmpty) {
// //                         return "Email required";
// //                       }
// //                       final emailRegex = RegExp(
// //                         r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
// //                       );
// //                       if (!emailRegex.hasMatch(value)) {
// //                         return "Enter a valid email";
// //                       }
// //                       return null;
// //                     },
// //                   ),
// //                   textField(
// //                     phoneNumberController,
// //                     "mobile number",
// //                     "hint",
// //                     Icons.phone_android,
// //                     () {},
// //                   ),
// //                   textField(
// //                     passWordControll,
// //                     "password ",
// //                     "hint",
// //                     Icons.remove_red_eye,
                    
// //                     (value) {
// //                         if (value == null) {
// //                           return "Password Required";
// //                         } else if (value.length < 6) {
// //                           return "Password must be at least 6 characters";
// //                         }
// //                         return null;
// //                       },
// //                   ),
// //                   ElevatedButton(
// //               onPressed: () =>_signUp(),
// //               child: Text("SignUp"),
// //             ),
// //                 ],
// //               ),
// //             ),
            
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Text("Already have a Accunt?"),
// //                 TextButton(
// //                   onPressed: () {
// //                     Navigator.pushReplacement(
// //                       context,
// //                       MaterialPageRoute(builder: (_) => LogInScreen()),
// //                     );
// //                   },
// //                   child: Text("LogIn"),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //   Future<void> _signUp() async {
// //   try {
// //      await Supabase.instance.client.auth.signUp(
// //       email: emailControll.text,
// //       password: passWordControll.text,
      
// //     );
    
// //   } on AuthException catch (error) {
    
// //    if (mounted) {
// //       Navigator.pushReplacement(
// //                     context,
// //                     MaterialPageRoute(builder: (_) => OtpVerifyScreen()),
// //                   );
// //    }
// //   } 
// // }
// // }





// import 'dart:math';

// import 'package:comic_world/controller/authentication_controller.dart';
// import 'package:comic_world/model/user_data.dart';
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
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   TextEditingController userNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController passwordConfirmController = TextEditingController();

//   bool _obscurePassword = true;
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     userNameController.dispose();
//     emailController.dispose();
//     phoneNumberController.dispose();
//     passwordController.dispose();
//     passwordConfirmController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             SizedBox(height: 80),

//             Text(
//               "Create Account",
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 40),
//             Form(
//               key: _formKey,
//               child: Column(
//                 spacing: 20,
//                 children: [

//                   TextFormField(
//                     controller: userNameController,
//                     validator:
//                         (v) => v!.isEmpty ? "Username is required" : null,
//                     decoration: _inputDecoration(
//                       "userName",
//                       Icons.person_outline,
//                     ),
//                   ),
//                   TextFormField(
//                     controller: emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (v) => v!.isEmpty ? "Email is required" : null,
//                     decoration: _inputDecoration("email", Icons.email),
//                   ),
//                   TextFormField(
//                     controller: phoneNumberController,
//                     keyboardType: TextInputType.phone,
//                     validator: (v) {
//                       if (v == null || v.isEmpty) return "Phone required";
//                       if (!RegExp(r'^\+?\d{10,13}$').hasMatch(v)) {
//                         return "Enter valid phone number";
//                       }
//                       return null;
//                     },
//                     decoration: _inputDecoration("phoneNum", Icons.phone),
//                   ),
//                   TextFormField(
//                     controller: passwordController,
//                     obscureText: _obscurePassword,
//                     validator: (v) {
//                       if (v == null || v.isEmpty) {
//                         return "Password required";
//                       } else if (v.length < 6) {
//                         return "At least 6 characters";
//                       } else if (!v.contains(RegExp(r'[aA-zZ]'))) {
//                         return "Must contain uppercase letter";
//                       } else if (!v.contains(RegExp(r'[0-9]'))) {
//                         return "Must contain a digit";
//                       } else if (!v.contains(
//                         RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
//                       )) {
//                         return "Must contain special character";
//                       }
//                       return null;
//                     },
//                     decoration: _inputDecoration(
//                       "password",
//                       Icons.lock,
//                     ).copyWith(
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _obscurePassword
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _obscurePassword = !_obscurePassword;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   TextFormField(
//                     controller: passwordConfirmController,
//                     obscureText: _obscurePassword,
//                     validator:
//                         (value) =>
//                             value == null || value.isEmpty
//                                 ? "Confirm your password"
//                                 : null,
//                     decoration: _inputDecoration("confirmPassword", Icons.lock),
//                   ),
//                   SizedBox(height: 20),

//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.cyan,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onPressed: _isLoading ? null : _signUp,
//                       child:
//                           _isLoading
//                               ? CircularProgressIndicator()
//                               : Text(
//                                 "Create Account",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Expanded(child: Divider(thickness: 1, endIndent: 10)),
//                       Text(
//                         "orSignInWith",
//                         style: TextStyle(color: Colors.grey[700]),
//                       ),
//                       Expanded(child: Divider(thickness: 1, indent: 10)),
//                     ],
//                   ),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Already have an account?"),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (_) => LogInScreen()),
//                           );
//                         },
//                         child: Text(
//                           "Login",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   InputDecoration _inputDecoration(String label, IconData icon) {
//     return InputDecoration(
//       labelText: label,
//       prefixIcon: Icon(icon),
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: BorderSide(color: Color(0xFFB39DDB)),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: BorderSide(color: Colors.black87, width: 2),
//       ),
//     );
//   }

//   // Future<void> _signUp() async {
//   //   if (_formKey.currentState!.validate()) {
//   //     final password = passwordController.text.trim();
//   //     final passwordConfirm = passwordConfirmController.text.trim();
//   //     if (password != passwordConfirm) {
//   //       ScaffoldMessenger.of(
//   //         context,
//   //       ).showSnackBar(SnackBar(content: Text("password do not mathch")));
//   //       setState(() {
//   //         _isLoading = false;
//   //       });
//   //       return;
//   //     }
//   //       final usermodel= UserModel(
//   //           id: "", 
//   //           userName: userNameController.text.trim(), 
//   //           email: emailController.text.trim(), 
//   //           avatarUrl: "", 
//   //           phone: phoneNumberController.text.trim(), 
//   //           role: "role");

//   //     final authProvider = Supabase.instance.client.auth.signUp(password: passwordController.text.trim(),email: emailController.text.trim());if(authProvider !=null){
//   //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>BottomNavBar()));
//   //     }
//   //   //   await authProvider.s( password.toString(),emailController.text);
//   //   //   if (authProvider != null) {
//   //   //     Navigator.pushReplacement(
//   //   //       context,
//   //   //       MaterialPageRoute(builder: (context) => BottomNavBar()),
//   //   //     );
//   //   //   } else if (authProvider.errorMessage != null) {
//   //   //     ScaffoldMessenger.of(
//   //   //       context,
//   //   //     ).showSnackBar(SnackBar(content: Text(authProvider.errorMessage!)));
//   //   //   }
//   //     // setState(() {
//   //     //   _isLoading = false;
//   //     // });
//   //   }
//   // }


//   Future<void> _signUp() async {
//   if (!_formKey.currentState!.validate()) return;

//   setState(() => _isLoading = true);

//   final email = emailController.text.trim();
//   final password = passwordController.text.trim();

//   try {
    
//     final response = await Supabase.instance.client.auth.signUp(
//       email: email,
//       password: password,
//       data: {
//         "username": userNameController.text.trim(),
//         "phone": phoneNumberController.text.trim(),
//         "role": "user",
//       },
//     );

    
//     if (response.user != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Signup successful! Please login.")),
//       );

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => LogInScreen()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Signup failed. Try again.${e.toString()}")),
//       );
//     }

//   } on AuthException catch (error) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(error.message)),
//     );
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Something went wrong")),
//     );
//   } finally {
//     if (mounted) setState(() => _isLoading = false);
//   }
// }

// }



import 'package:comic_world/user/view/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoading = false;
  bool obscure = true;

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        data: {
          "username": userNameController.text.trim(),
          "phone": phoneController.text.trim(),
          "role": "user",
        },
      );

      if (response.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Account created! Please verify your email.")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => LogInScreen()),
        );
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 60),
            Text("Create Account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),

            Form(
              key: _formKey,
              child: Column(
                spacing: 18,
                children: [
                  TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(labelText: "Username", prefixIcon: Icon(Icons.person)),
                    validator: (v) => v!.isEmpty ? "Required" : null,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: "Email", prefixIcon: Icon(Icons.email)),
                    validator: (v) => v!.isEmpty ? "Required" : null,
                  ),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(labelText: "Phone", prefixIcon: Icon(Icons.phone)),
                    validator: (v) => v!.isEmpty ? "Required" : null,
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
                    ),
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: obscure,
                    decoration: InputDecoration(labelText: "Confirm password", prefixIcon: Icon(Icons.lock)),
                  ),

                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isLoading ? null : _signUp,
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text("Sign Up"),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => LogInScreen()),
                  ),
                  child: Text("Login"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
