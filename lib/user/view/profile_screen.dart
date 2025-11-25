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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assetName"),
              child: Column(
                children: [
                  Title(color: Colors.black, child: Text("UserName")),
                  Text("emil"),
                ],
              ),
            ),
            ListTile(
              title: Text("notification"),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              title: Text("system"),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              title: Text("Contact Us"),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              title: Text("privacy policy"),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              title: Text("Terms & Conditions"),
              trailing: Icon(Icons.arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}