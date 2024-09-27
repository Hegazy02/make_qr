import 'package:flutter/material.dart';

import 'core/di/get_it.dart';
import 'make_qr_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const MakeQrApp());
}
