import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assetName"),
              child: Column(
                children: [
                  
                ],
              ),
            ),
            Title(color: Colors.black, child: Text("UserName")),
                  Text("emil"),
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