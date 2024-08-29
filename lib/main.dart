import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:personnel_management/common/app_bindings.dart';
import 'package:personnel_management/common/app_router.dart';
import 'package:personnel_management/parts/auth/data/data_sources/local/auth_local_datasource_impl.dart';

import 'app.dart';

void main() async {
  await Setup.initialize();
  runApp(const App());
}

class Setup {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    await AppBindings().dependencies();
    WidgetsFlutterBinding.ensureInitialized();
  }

  static void logout() async {
    Get.find<AuthLocalDataSourceImpl>().clear();
    Get.offAllNamed(RoutesName.login);
  }
}
