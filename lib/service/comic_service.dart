
import 'dart:developer';
import 'dart:io';

import 'package:comic_world/model/comic_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ComicService {
  final comicsService = Supabase.instance.client;

  Future<void> getProduct() async {
    try {
      await comicsService.from("comic_store").select();
    } on Exception catch (e) {
      log("Error is a not get provider$e");
    } catch (e) {
      log("Error is a not get provider$e");
    }
  }

  Future<void> insertComic(ComicBookModel comic) async {
    try {
      await comicsService.from('comic_store').insert(comic.toJson());
    } on Exception catch (e) {
      log("Error is a not get provider$e");
    } catch (e) {
      log("Error is a not get provider$e");
    }
  }

  Future<void> updateComic(ComicBookModel comic) async {
    try {
      await comicsService
          .from('comic_store')
          .update(comic.toJson())
          .eq("id", comic.id);
    } on Exception catch (e) {
      log("Error is a not update provider$e");
    } catch (e) {
      log("Error is a not update provider$e");
    }
  }

  Future<void> deleteComic(String id) async {
    try {
      await comicsService.from('comic_store').delete();
    } on Exception catch (e) {
      log("Error is a not delete provider$e");
    }
  }

  Future<String?> uploadComicCover(File imageFile) async {
    try {
      final String path = 'covers/${DateTime.now().millisecondsSinceEpoch}.jpg';
      await comicsService.storage.from("comic_store").upload(path, imageFile);
      final String publicUrl = comicsService.storage
          .from("comic_store")
          .getPublicUrl(path);
      return publicUrl;
    } catch (e) {
      throw Exception('Failed to upload comic cover: $e');
    }
  }

  Future<List<ComicBookModel>> searchComics(String keyword) async {
    try {
      final response = await comicsService
          .from("comic_store")
          .select()
          .ilike('title', '%$keyword%');

      return (response as List)
          .map((comic) => ComicBookModel.from(comic))
          .toList();
    } catch (e) {
      throw Exception('Search failed: $e');
    }
  }

  Future<List<ComicBookModel>> filterByCategory(String category) async {
    try {
      final response = await comicsService
          .from("comic")
          .select()
          .eq('category', category);

      return (response as List)
          .map((comic) => ComicBookModel.from(comic))
          .toList();
    } catch (e) {
      throw Exception('Category filter failed: $e');
    }
  }
}
