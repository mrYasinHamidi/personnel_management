import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:personnel_management/common/app_bindings.dart';

import 'app.dart';

void main() async {
  await Setup.initialize();
  runApp(App());
}

class Setup {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    await AppBindings().dependencies();
    WidgetsFlutterBinding.ensureInitialized();
  }

  static void logout() async {}
}
