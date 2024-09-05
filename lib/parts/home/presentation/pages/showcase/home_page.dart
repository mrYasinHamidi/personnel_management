import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/main.dart';
import 'package:personnel_management/parts/home/presentation/manager/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: Setup.logout,
                child: Text('logout'.tr),
              ),
              ElevatedButton(
                onPressed: controller.getHomeData,
                child: Text('getdata'.tr),
              ),
              controller.obx(
                (state) {
                  return Column(
                    children: [
                      Text(state.toString()),
                      ElevatedButton(
                        onPressed: controller.openCreatePersonnelPage,
                        child: Text('createPersonnel'.tr),
                      ),
                      ElevatedButton(
                        onPressed: controller.openWorkPlaceList,
                        child: Text('workPlaceList'.tr),
                      ),
                      ElevatedButton(
                        onPressed: controller.openShiftListPage,
                        child: Text('shiftList'.tr),
                      ),
                    ],
                  );
                },
                onError: (error) => Text(error ?? ''),
                onLoading: const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
