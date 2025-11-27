// import 'package:comic_world/controller/authentication_controller.dart';
// import 'package:comic_world/user/view/bottom_nav_bar.dart';
// import 'package:comic_world/user/view/sign_up_screen.dart';
// import 'package:comic_world/user/widgets/textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class LogInScreen extends StatefulWidget {
//   const LogInScreen({super.key});

//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }

// class _LogInScreenState extends State<LogInScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final emailCntrl = TextEditingController();
//   final passwordCntrl = TextEditingController();
//   bool isLoading = false;

//   void dispose() {
//     emailCntrl.dispose();
//     passwordCntrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final provider=Provider.of<AuthenticationController>(context);
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             spacing: 20,
//             children: [
//               Text("LogIn"),
//               Text("Welcome Back to our comic book store"),
//               SizedBox(height: 20),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   spacing: 20,
//                   children: [
//                     textField(
//                       emailCntrl,
//                       "Email",
//                       "Enter a email Id",
//                       Icons.message,
//                       (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Email required";
//                       }
//                       final emailRegex = RegExp(
//                         r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
//                       );
//                       if (!emailRegex.hasMatch(value)) {
//                         return "Enter a valid email";
//                       }
//                       return null;
//                     },
//                     ),
//                     textField(
//                       passwordCntrl,
//                       "Password",
//                       "Enter a Password",
//                       Icons.add,
//                       (value) {
//                         if (value == null) {
//                           return "Password Required";
//                         } else if (value.length < 6) {
//                           return "Password must be at least 6 characters";
//                         }
//                         return null;
//                       },
//                     ),
//                     ElevatedButton(
//                       onPressed: () async {
//                         await Supabase.instance.client.auth.signInWithPassword(
//                           email: emailCntrl.text.trim(),
//                           password: passwordCntrl.text.trim(),
//                         );
//                         if (mounted) {
//                           Navigator.of(context).pushReplacement(
//                             MaterialPageRoute(
//                               builder: (context) => BottomNavBar(),
//                             ),
//                           );
//                         }
//                       },
//                       child: Text("LogIn"),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [Divider(), Text("or"), Divider()],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(" Does'Not have a Accunt "),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(builder: (_) => SignUpScreen()),
//                             );
//                           },
//                           child: Text("SignUp"),
//                         ),
//                       ],
//                     ),
//                     GestureDetector(
//                       onTap: () {},
//                       child: Container(
//                         width: 30,
//                         height: 30,
//                         child: Icon(Icons.g_mobiledata),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _login() async {
//   if (!_formKey.currentState!.validate()) return;

//   setState(() => isLoading = true);

//   try {
//     final response = await Supabase.instance.client.auth.signInWithPassword(
//       email: emailCntrl.text.trim(),
//       password: passwordCntrl.text.trim(),
//     );

//     if (response.user != null) {
//       // Fetch user data (username, phone from metadata)
//       final user = response.user!;
//       final userMetadata = user.userMetadata ?? {};

//       final username = userMetadata['username'] ?? "User";
//       final phone = userMetadata['phone'] ?? "No phone";
//       final email = user.email ?? "Unknown";

//       // Pass data to Provider (optional)
//       // final provider = Provider.of<UserProvider>(context, listen: false);
//       // provider.setUser(username, phone, email);

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Login Successful")),
//       );

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => BottomNavBar()),
//       );
//     }

//   } on AuthException catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(e.message)),
//     );
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Something went wrong")),
//     );
//   } finally {
//     if (mounted) setState(() => isLoading = false);
//   }
// }
// }










// if (value == null || value.isEmpty) {
                    //     return "Email required";
                    //     }
                    //     final emailRegex = RegExp(
                    //       r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    //     );
                    //     if (!emailRegex.hasMatch(value)){
                    //       return "Enter a valid email";
                    //     }
                    //     return null;










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
      //🔥 Important for Web: clear old active session
      await Supabase.instance.client.auth.signOut();

      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (response.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login Successful 🎉")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => BottomNavBar()),
        );
      }

    } on AuthException catch (e) {
      // Special email confirmation check
      if (e.message.contains("Email not confirmed")) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please verify your email before logging in.")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Something went wrong")),
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
