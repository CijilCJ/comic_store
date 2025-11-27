import 'dart:math';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  @override
  Widget build(BuildContext context) {
  final user = Supabase.instance.client.auth.currentUser;
  final username = user?.userMetadata?['username'] ?? "No Name";
  final email = user?.email ?? "No Email";
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 20,
          children: [
            Stack(
              
              children:[ CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assetName"),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.person)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55.0,top: 75),
                child: IconButton(onPressed: ()async{}, icon: Icon(Icons.camera_alt)),
              )
          ]),
            Title(color: Colors.black, child: Text("$username")),
                  Text("$email"),
            ListTile(
              onTap: (){},
              title: Text("notification"),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: (){},
              title: Text("system"),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: (){},
              title: Text("Contact Us"),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: (){},
              title: Text("privacy policy"),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: (){},
              title: Text("Terms & Conditions"),
              trailing: Icon(Icons.arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}