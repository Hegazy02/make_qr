import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerService {
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
      return null;
    }
  }

  Future<File?> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        File file = File(result.files.single.path!);
        return file;
      } else {
        return null;
      }
    } catch (e) {
      log("pickFile error : $e");
      return null;
    }
  }
}
