import 'package:flutter/material.dart';

Widget textField(
  final controller,
  String label,
  String hint,
){
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      border: OutlineInputBorder(
      )
    ),
  );
     
}

// textFormField(
//                       controller: controller,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Email required";
//                         }
//                         final emailRegex = RegExp(
//                           r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
//                         );
//                         if (!emailRegex.hasMatch(value)) {
//                           return "Enter a valid email";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Email",
//                         prefixIcon: const Icon(Icons.email, color: Colors.blue),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide: BorderSide(
//                             color: const Color(0xFFB39DDB),
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide: BorderSide(color: Colors.blue, width: 2),
//                         ),
//                       ),
//                     ),

//                     TextFormField(
//                       controller: passwordController,
//                       obscureText: _obscurePassword,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Password required";
//                         } else if (value.length < 6) {
//                           return "Password must be at least 6 characters";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Password",
//                         prefixIcon: const Icon(Icons.lock, color: Colors.blue),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscurePassword
//                                 ? Icons.visibility_off
//                                 : Icons.visibility,
//                             color: Colors.blue,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscurePassword = !_obscurePassword;
//                             });
//                           },
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide: BorderSide(
//                             color: Colors.deepPurple.shade200,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide: BorderSide(color: Colors.blue, width: 2),
//                         ),
//                       ),
//                     // );