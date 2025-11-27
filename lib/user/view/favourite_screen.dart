import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  //  SearchController searchController=SearchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Favourite comic books "),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.select_all))
        ],
      ),
      body: Column(
        spacing: 20,
        children: [
          SearchBar(
            controller: SearchController(),
          ),
          Expanded(child: GridView.count(crossAxisCount: 2,children: [
            Card(
              color: Colors.blue,
              child: Column(
                spacing: 10,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Icon(Icons.photo),
                    ),
                  ),
                  Title(color: Colors.black, child: Text("Comic Name")),
                  Text("auther"),
                  Text("Price")
                ],
              ),
            ),
            Card(
              color: Colors.blue,
              child: Column(
                spacing: 10,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Icon(Icons.photo),
                    ),
                  ),
                  Title(color: Colors.black, child: Text("Comic Name")),
                  Text("auther"),
                  Text("Price")
                ],
              ),
            ),
            Card(
              color: Colors.blue,
              child: Column(
                spacing: 10,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Icon(Icons.photo),
                    ),
                  ),
                  
                  Title(color: Colors.black, child: Text("Comic Name")),
                  Text("auther"),
                  Text("Price")
                ],
              ),
            ),
            Card(
              color: Colors.blue,
              child: Column(
                spacing: 10,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Icon(Icons.photo),
                    ),
                  ),
                  Title(color: Colors.black, child: Text("Comic Name")),
                  Text("auther"),
                  Text("Price")
                ],
              ),
            ),
          ],))
          // GridView.count(
          //   crossAxisCount: 2,
          //   children: [
          //     Card(
          //       color: Colors.blue,
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}