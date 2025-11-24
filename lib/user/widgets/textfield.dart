import 'package:flutter/material.dart';

Widget textField(
  final controller,
  String label,
  String hint,
  IconData icon,
  Function value
){
  return  TextFormField(
     controller: controller,
     validator: (value){},
     decoration: InputDecoration(
      hintText: hint,
      label: Text(label),
      prefixIcon: Icon(icon), 
      border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
      color: const Color(0xFFB39DDB),
     ),
   ),
     )
  );    
}


//  TextFormField(
                    //   controller: emaiController,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return "Email required";
                    //     }
                    //     final emailRegex = RegExp(
                    //       r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    //     );
                    //     if (!emailRegex.hasMatch(value)) {
                    //       return "Enter a valid email";
                    //     }
                    //     return null;
                    //   },
                    //   decoration: InputDecoration(
                    //     labelText: "Email",
                    //     prefixIcon: const Icon(Icons.email, color: Colors.blue),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //       borderSide: BorderSide(
                    //         color: const Color(0xFFB39DDB),
                    //       ),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //       borderSide: BorderSide(color: Colors.blue, width: 2),
                    //     ),
                    //   ),
                    // ),