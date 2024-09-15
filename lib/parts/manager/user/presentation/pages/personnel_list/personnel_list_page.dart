import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personnel_management/common/widgets/default_list_view.dart';
import 'package:personnel_management/parts/manager/user/presentation/manager/personnel_list_controller.dart';

class PersonnelListPage extends GetView<PersonnelListController> {
  const PersonnelListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('personnelList'.tr),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.createPersonnel,
        child: const Icon(Icons.add),
      ),
      body: DefaultPagedListView(
        loadController: controller.loadController,
        itemBuilder: (context, entry, index) {
          return ListTile(
            onTap: () => controller.editPersonnel(entry),
            title: Text('${'name'.tr} : ${entry.name}'),
            subtitle: Text('${'username'.tr} : ${entry.username}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => controller.editPersonnel(entry),
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () => controller.deletePersonnel(entry),
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
