import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/common/tools/toast.dart';
import 'package:personnel_management/parts/home/domain/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  final users = <UserEntity>[].obs;

  HomeController(this.repository);

  getUsers() async {
    final res = await repository.getUsers();
    res.fold((l) => Toast.showError(l.message), (r) =>null);
  }
}
