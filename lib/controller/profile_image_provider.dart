import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageProvider extends ChangeNotifier{
    File? profileImage;
    

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }
}