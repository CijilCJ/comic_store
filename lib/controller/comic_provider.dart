
// import 'package:comic_world/model/comic_model.dart';
// import 'package:comic_world/service/comic_service.dart';
// import 'package:flutter/material.dart';


// class ComicController with ChangeNotifier {
//   final ComicService _supabaseService = ComicService();

//   List<ComicBookModel> _comics = [];
//   final List<ComicBookModel> _cart = [];
//   final List<ComicBookModel> _favorites = [];

//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   List<ComicBookModel> get comics => _comics;
//   List<ComicBookModel> get cart => _cart;
//   List<ComicBookModel> get favorites => _favorites;

  
//   Future<void> fetchComics() async {
//     try {
//       _isLoading = true;
//       notifyListeners();

//       await _supabaseService.getComics();
//       // _comics = response.map((data) => ComicBookModel.from(data) ).toList();
//     } catch (e) {
//       debugPrint("Error fetching comics: $e");
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

  
//   void addToCart(ComicBookModel comic) {
//     if (!_cart.contains(comic)) {
//       _cart.add(comic);
//       notifyListeners();
//     }
//   }


//   void removeFromCart(ComicBookModel comic) {
//     _cart.removeWhere((item) => item.id == comic.id);
//     notifyListeners();
//   }

//   void clearCart() {
//     _cart.clear();
//     notifyListeners();
//   }


//   void toggleFavorite(ComicBookModel comic) {
//     comic.isFavorite = !comic.isFavorite;
//     if (comic.isFavorite) {
//       _favorites.add(comic);
//     } else {
//       _favorites.removeWhere((item) => item.id == comic.id);
//     }
//     notifyListeners();
//   }

//   Future<void> addComic(ComicBookModel comic) async {
//     try {
//       await _supabaseService..insertComic(comic);
      
//       notifyListeners();
//     } catch (e) {
//       debugPrint("Error adding comic: $e");
//     }
//   }

  
//   Future<void> updateComic( id, data) async {
//     try {
//       await _supabaseService.getComics();
//       int index = _comics.indexWhere((comic) => comic.id == id);
//       if (index != -1) {
//         _comics[index] = ComicBookModel.from({
//           ..._comics[index].toJson(),
//           ...data,
//         });
//         notifyListeners();
//       }
//     } catch (e) {
//       debugPrint("Error updating comic: $e");
//     }
//   }
  
//   Future<void> deleteComic(String id) async {
//     try {
//       await _supabaseService.deleteComic(id);
//       _comics.removeWhere((comic) => comic.id == id);
//       notifyListeners();
//     } catch (e) {
//       debugPrint("Error deleting comic: $e");
//     }
//   }
// }