import 'package:get/get.dart';
import 'package:personnel_management/parts/shift/data/data_sources/remote/shift_remote_data_source_impl.dart';
import 'package:personnel_management/parts/shift/data/repositories/shift_repository_impl.dart';

class ShiftListBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ShiftRemoteDataSourceImpl(request: Get.find()));
    Get.put(ShiftRepositoryImpl(remoteDataSource: Get.find<ShiftRemoteDataSourceImpl>()));
    // Get.put(CreateShiftUseCase(repository: Get.find<ShiftRepositoryImpl>()));
    // Get.put(CreateShiftController(createShift: Get.find()));
  }
}
