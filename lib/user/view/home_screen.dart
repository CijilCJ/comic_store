import 'dart:io';

import 'package:comic_world/controller/authentication_controller.dart';
import 'package:comic_world/controller/profile_image_provider.dart';
import 'package:comic_world/model/comic_model.dart';
import 'package:comic_world/model/user_data.dart';
import 'package:comic_world/user/view/profile_screen.dart';
import 'package:comic_world/user/widgets/home_screen_custom.dart';
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
            TextField(
              controller: searchCntrl,
              decoration: InputDecoration(
                hintText: "Search comics, characters, genres...",
                prefixIcon:Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
               
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 150,
                 width: 500,
                color: Colors.blue,
                child: Row(
                  spacing: 30,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                            "Today’s Special Offer",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    ),
                        SizedBox(height: 8),
                        Text(
                          "Get up to 50% OFF on\nTop trending comics.",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                  ],
                ),
              ),
            ),
            // Title(color: Colors.black, child: Text("All")),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
        
            //     ],
            //   ),
            // ),
            // Title(color: Colors.black, child: Text("treining")),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
        
            //     ],
            //   ),
            // ),
            // Title(color: Colors.black, child: Text("action")),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
                  
            //     ],
            //   ),
            // ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                CategoryChip(label: "All"),
                CategoryChip(label: "Action"),
                CategoryChip(label: "Romance"),
                CategoryChip(label: "Fantasy"),
                CategoryChip(label: "Comedy"),
                CategoryChip(label: "Horror"),
              ],
            ),
            SizedBox(
              height: 230,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: demoComics.length,
                separatorBuilder: (_, __) => SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final comic = demoComics[index];
                  return _ComicCard(comic: comic);
                },
              ),
            ),
             SizedBox(
              height: 230,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: demoComics.length,
                separatorBuilder: (_, __) => SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final comic = demoComics[(index + 2) % demoComics.length];
                  return _ComicCard(comic: comic);
                },
              ),
            ),
            Column(
              children: demoComics
                  .map((comic) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: _ComicListTile(comic: comic),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }


  final demoComics = [
  ComicBookModel(
    id: 1,
    title: "Naruto: Volume 1",
    author: "Masashi Kishimoto",
    price: 199,
    description: "very mage",
    imageUrl: "",
    releaseDate: DateTime(2026),
    isFavorite: true,
    category: "Action",
  ),
  ComicBookModel(
    id: 1,
    title: "Naruto: Volume 1",
    author: "Masashi Kishimoto",
    price: 199,
    description: "very mage",
    imageUrl: "",
    releaseDate: DateTime(2026),
    isFavorite: true,
    category: "Action",
  ),
  ComicBookModel(
    id: 1,
    title: "Naruto: Volume 1",
    author: "Masashi Kishimoto",
    price: 199,
    description: "very mage",
    imageUrl: "",
    releaseDate: DateTime(2026),
    isFavorite: true,
    category: "Action",
  ),
];
}



class _ComicCard extends StatelessWidget {
  final ComicBookModel comic;
  const _ComicCard({required this.comic});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {


          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: Image.asset(
                    comic.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comic.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      comic.author,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹${comic.price.toStringAsFixed(0)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 14, color: Colors.amber),
                            const SizedBox(width: 2),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _ComicListTile extends StatelessWidget {
  final ComicBookModel comic;
  const _ComicListTile({required this.comic});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 55,
          height: 75,
          child: Image.asset(
            comic.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: Colors.grey[300],
              child: const Icon(Icons.image_not_supported),
            ),
          ),
        ),
      ),
      title: Text(
        comic.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        comic.author,
        style: const TextStyle(fontSize: 12),
      ),
      trailing: Text(
        "₹${comic.price.toStringAsFixed(0)}",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: () {
        
      },
    );
  }
}