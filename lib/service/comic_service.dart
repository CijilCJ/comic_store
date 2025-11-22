// import 'dart:io';

// import 'package:comic_world/model/comic_model.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class ComicService {
//   final supabase = Supabase.instance.client;

//   Future<List<ComicBookModel>> getComics() async {
//     final res = await supabase.from('comics').select();
//     return (res as List).map((e) => ComicBookModel.from(e)).toList();
//   }


//   Future<void> insertComic(ComicBookModel comic) async {
//     await supabase.from('comics').insert(comic.toJson());
//   }


//   Future<void> deleteComic(String id) async {
//     await supabase.from('comics').delete().eq('id', id); 
//   }


//   Future<String?> uploadComicCover(File imageFile) async {
//     try {
//       final String path = 'covers/${DateTime.now().millisecondsSinceEpoch}.jpg';
//       await supabase.storage.from("comic").upload(path, imageFile);
//       final String publicUrl = supabase.storage.from("comic").getPublicUrl(path);
//       return publicUrl;
//     } catch (e) {
//       throw Exception('Failed to upload comic cover: $e');
//     }
//   }


//   Future<List<ComicBookModel>> searchComics(String keyword) async {
//     try {
//       final response = await supabase
//           .from("comic")
//           .select()
//           .ilike('title', '%$keyword%');

//       return (response as List)
//           .map((comic) => ComicBookModel.from(comic))
//           .toList();
//     } catch (e) {
//       throw Exception('Search failed: $e');
//     }
//   }


//   Future<List<ComicBookModel>> filterByCategory(String category) async {
//     try {
//       final response =
//           await supabase.from("comic").select().eq('category', category);

//       return (response as List)
//           .map((comic) => ComicBookModel.from(comic))
//           .toList();
//     } catch (e) {
//       throw Exception('Category filter failed: $e');
//     }
//   }
// }

import 'package:supabase_flutter/supabase_flutter.dart';

class ComicService {
  final comicsService=Supabase.instance.client;

  
}