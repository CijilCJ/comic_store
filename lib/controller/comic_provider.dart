import 'package:comic_world/model/comic_model.dart';
import 'package:comic_world/service/comic_service.dart';
import 'package:flutter/material.dart';

class ComicProvider extends ChangeNotifier {
  final ComicService clientService = ComicService();

  List<ComicBookModel> comics = [];
  bool isLoading = false;
  String errorMessage = "";

  Future<void> getFunction() async {
    isLoading = false;
    notifyListeners();
    try {
      await clientService.getProduct();
    } catch (e) {
      if (e == 400) {
        errorMessage = "";
      } else if (e == 200) {
        errorMessage = "";
      } else if (e == 404) {
        errorMessage = "";
      } else if (e == 401) {
        errorMessage = "";
      } else if (e == 403) {
        errorMessage = "";
      } else if (e == 202) {
        errorMessage = "";
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> interstFunction(ComicBookModel comic) async {
    isLoading = false;
    notifyListeners();
    try {
      await clientService.insertComic(comic);
    } catch (e) {
      if (e == 400) {
        errorMessage = "";
      } else if (e == 200) {
        errorMessage = "";
      } else if (e == 404) {
        errorMessage = "";
      } else if (e == 401) {
        errorMessage = "";
      } else if (e == 403) {
        errorMessage = "";
      } else if (e == 202) {
        errorMessage = "";
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateFunction(ComicBookModel comic) async {
    isLoading = false;
    notifyListeners();
    try {
      await clientService.updateComic(comic);
    } catch (e) {
      if (e == 400) {
        errorMessage = "";
      } else if (e == 200) {
        errorMessage = "";
      } else if (e == 404) {
        errorMessage = "";
      } else if (e == 401) {
        errorMessage = "";
      } else if (e == 403) {
        errorMessage = "";
      } else if (e == 202) {
        errorMessage = "";
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteFunction(ComicBookModel comic) async {
    isLoading = false;
    notifyListeners();
    try {
      await clientService.deleteComic(comic.id);
    } catch (e) {
      if (e == 400) {
        errorMessage = "";
      } else if (e == 200) {
        errorMessage = "";
      } else if (e == 404) {
        errorMessage = "";
      } else if (e == 401) {
        errorMessage = "";
      } else if (e == 403) {
        errorMessage = "";
      } else if (e == 202) {
        errorMessage = "";
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
