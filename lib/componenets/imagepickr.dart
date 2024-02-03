import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickModel{

  File? image;
  final imagePicker = ImagePicker();
  uploadImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    image =File(pickedImage!.path);
  }
}
