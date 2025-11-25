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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SearchBar(
              controller: SearchController(),
            ),
            // GridView.count(
            //   crossAxisCount: 2,
            //   children: [
            //     Card()
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}