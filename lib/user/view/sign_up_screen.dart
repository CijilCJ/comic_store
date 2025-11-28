
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



// import 'package:comic_world/user/view/log_in_screen.dart';
// import 'package:flutter/material.dart';
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
//   bool obscurePass = true;
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

//   // Phone validation
//   bool validatePhone(String phone) {
//     final phonePattern = RegExp(r'^\+?[0-9]{10,15}$'); // Accepts +91 or just 10–15 digits
//     return phonePattern.hasMatch(phone);
//   }

//   Future<void> _signUp() async {
//     if (!_formKey.currentState!.validate()) return;

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
//           const SnackBar(
//             content: Text("Account created! Check your email to verify."),
//             backgroundColor: Colors.green,
//           ),
//         );

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => const LogInScreen()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Signup failed. Please try again."),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } on A uthException catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(e.message),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Something went wrong. Try again."),
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
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             const SizedBox(height: 60),
//             const Text(
//               "Create Account",
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 30),

//             Form(
//               key: _formKey,
//               child: Column(
//                 spacing: 18,
//                 children: [
//                   // Username
//                   TextFormField(
//                     controller: userNameController,
//                     decoration: const InputDecoration(
//                       labelText: "Username",
//                       prefixIcon: Icon(Icons.person),
//                     ),
//                     validator: (v) => v!.trim().isEmpty ? "Username is required" : null,
//                   ),

//                   // Email
//                   TextFormField(
//                     controller: emailController,
//                     decorati on: const InputDecoration(
//                       labelText: "Email",
//                       prefixIcon: Icon(Icons.email),
//                     ),
//                     validator: (v) {
//                       if (v!.trim().isEmpty) return "Email is required";
//                       final emailRegex = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$');
//                       return emailRegex.hasMatch(v.trim())
//                           ? null
//                           : "Enter a valid email (example@gmail.com)";
//                     },
//                   ),

//                   // Phone
//                   TextFormField(
//                     controller: phoneController,
//                     decoration: const InputDecoration(
//                       labelText: "Phone Number",
//                       prefixIcon: Icon(Icons.phone),
//                     ),
//                     validator: (v) => v!.trim().isEmpty
//                         ? "Phone number required"
//                         : !validatePhone(v.trim())
//                             ? "Enter valid phone (Ex: +91XXXXXXXXXX)"
//                             : null,
//                   ),

//                   // Password
//                   TextFormField(
//                     controller: passwordController,
//                     obscureText: obscurePass,
//                     decoration: InputDecoration(
//                       labelText: "Password",
//                       prefixIcon: const Icon(Icons.lock),
//                       suffixIcon: IconButton(
//                         icon: Icon(obscurePass ? Icons.visibility_off : Icons.visibility),
//                         onPressed: () => setState(() => obscurePass = !obscurePass),
//                       ),
//                     ),
//                     validator: (v) =>
//                         v!.length < 6 ? "Password must be at least 6 characters" : null,
//                   ),

//                   // Confirm Password
//                   TextFormField(
//                     controller: confirmPasswordController,
//                     obscureText: obscureConfirmPass,
//                     decoration: InputDecoration(
//                       labelText: "Confirm Password",
//                       prefixIcon: const Icon(Icons.lock),
//                       suffixIcon: IconButton(
//                         icon: Icon(obscureConfirmPass ? Icons.visibility_off : Icons.visibility),
//                         onPressed: () => setState(() => obscureConfirmPass = !obscureConfirmPass),
//                       ),
//                     ),
//                     validator: (v) => v != passwordController.text
//                         ? "Passwords do not match"
//                         : null,
//                   ),

//                   const SizedBox(height: 20),

//                   ElevatedButton(
//                     onPressed: isLoading ? null : _signUp,
//                     child: isLoading
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text("Sign Up"),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Already have an account?"),
//                 TextButton(
//                   onPressed: () => Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (_) => const LogInScreen()),
//                   ),
//                   child: const Text("Login"),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
