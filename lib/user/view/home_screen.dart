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
          spacing: 50,
          children: [
            SearchBar(
              controller: searchCntrl,
            ),
            Container(
              height: 150,
              width: 500,
              color: Colors.blue,
            ),
            Row(
              spacing: 20,
              children: [
                ElevatedButton(onPressed: (){}, child: Text("data")),
                ElevatedButton(onPressed: (){}, child: Text("data")),
                ElevatedButton(onPressed: (){}, child: Text("data")),
                ElevatedButton(onPressed: (){}, child: Text("data")),
                ElevatedButton(onPressed: (){}, child: Text("data")),
              ],
            ),
            //  ListView.builder(
            //   itemCount: 1,
            //   itemBuilder: (context, index){
            //     return Card();
            //   }
            //  )
          ],
        ),
      ),
    );
  }
}