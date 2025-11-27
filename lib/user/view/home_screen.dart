import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchCntrl =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WelCome to Comic World"),
        actions: [
          CircleAvatar(
            child: TextButton(onPressed: (){}, child: Icon(Icons.person)),
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