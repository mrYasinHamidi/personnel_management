import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/app_router.dart';
import 'package:personnel_management/common/translator.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Translator(),
      locale: Translator.defaultLocal,
      fallbackLocale: Translator.fa,
      getPages: AppRouter.pages,
      initialRoute: AppRouter.initialRoute,
    );
  }
}
