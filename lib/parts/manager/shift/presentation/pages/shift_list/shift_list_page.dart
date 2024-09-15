import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/widgets/default_list_view.dart';
import 'package:personnel_management/parts/manager/shift/presentation/manager/shift_list_controller.dart';

class ShiftListPage extends GetView<ShiftListController> {
  const ShiftListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shiftList'.tr),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.createShift,
        child: const Icon(Icons.add),
      ),
      body: DefaultPagedListView(
        loadController: controller.loadController,
        itemBuilder: (context, entry, index) {
          return ListTile(
            title: Text(entry.name),
            subtitle: Text('${entry.startTime} => ${entry.endTime}'),
            trailing: Text(entry.floatTime?.toString() ?? ''),
            onTap: () => controller.editShift(entry),
          );
        },
      ),
    );
  }
}
