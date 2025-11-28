import 'dart:io';

import 'package:comic_world/controller/authentication_controller.dart';
import 'package:comic_world/controller/profile_image_provider.dart';
import 'package:comic_world/model/user_data.dart';
import 'package:comic_world/user/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final searchCntrl =TextEditingController();
  @override
  Widget build(BuildContext context) {
      final profile = context.watch<ProfileImageProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("WelCome to Comic World"),
        actions: [
          CircleAvatar(
            backgroundImage: profile.profileImage != null
                ? FileImage(profile.profileImage!)
                : AssetImage("assets/user.png") as ImageProvider,
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
  
          spacing: 50,
          children: [
            SearchBar(
              controller: searchCntrl,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 150,
                 width: 500,
                color: Colors.blue,
              ),
            ),
            Title(color: Colors.black, child: Text("All")),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
        
                ],
              ),
            ),
            Title(color: Colors.black, child: Text("treining")),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
        
                ],
              ),
            ),
            Title(color: Colors.black, child: Text("action")),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}