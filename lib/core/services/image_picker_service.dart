import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static ImagePickerService instance = ImagePickerService();
  // Returns a [File] object pointing to the image that was picked.
  Future<File> pickImage(
      {@required ImageSource source, double maxWidth}) async {
    return ImagePicker.pickImage(source: source, maxWidth: maxWidth);
  }

  Future<File> pickvideo(
      {@required ImageSource source, Duration maxDuration}) async {
    return ImagePicker.pickVideo(source: source, maxDuration: maxDuration);
  }

  Future<File> pickImageFromGallery({double maxWidth}) async {
    return pickImage(source: ImageSource.gallery, maxWidth: maxWidth);
  }

  Future<File> pickImageFromCamera({double maxWidth}) async {
    return pickImage(source: ImageSource.camera, maxWidth: maxWidth);
  }
}
