import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FilePickerService {
  Future captureImage() async {
    ImagePicker picker = ImagePicker();
    try {
      final pickedFile =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 25);
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        return imageFile;
      } else {
        return null;
      }
    } catch (e) {
      log("captureImage error : $e");
    }
  }

  Future<File?> pickImage() async {
    try {
      ImagePicker picker = ImagePicker();
      final pickedFile =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        return imageFile;
      } else {
        return null;
      }
    } catch (e) {
      log("pickImage error : $e");
    }
  }
}
