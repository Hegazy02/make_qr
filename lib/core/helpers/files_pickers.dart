import 'dart:developer';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hl_image_picker/hl_image_picker.dart';
import 'package:make_qr/core/constants/translation.dart';

class FilePickerService {
  final _picker = HLImagePicker();

  Future<File?> pickImage() async {
    try {
      final List<HLPickerItem> images = await _picker.openPicker(
          localized: LocalizedImagePicker(
            doneText: Translation.done.tr(),
            cancelText: Translation.cancel.tr(),
          ),
          pickerOptions: const HLPickerOptions(mediaType: MediaType.image));
      if (images.isNotEmpty) {
        File file = File(images.first.path);
        log("file path : ${file.path}");
        return file;
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
