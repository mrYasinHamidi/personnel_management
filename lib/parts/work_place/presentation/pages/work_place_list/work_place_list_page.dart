import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/widgets/default_list_view.dart';
import 'package:personnel_management/parts/work_place/presentation/manager/work_place_list_controller.dart';

class WorkPlaceListPage extends GetView<WorkPlaceListController> {
  const WorkPlaceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('workPlaceList'.tr),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.createWorkPlace,
        child: const Icon(Icons.add),
      ),
      body: DefaultPagedListView(
        loadController: controller.loadController,
        itemBuilder: (context, entry, index) {
          return ListTile(
            title: Text(entry.name),
            subtitle: Text('${entry.city} ( ${entry.address} )'),
            onTap: () => controller.editWorkPlace(entry),
            leading: Row(
              children: [
                IconButton(
                  onPressed: () => controller.editWorkPlace(entry),
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () => controller.deleteWorkPlace(entry),
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
