import 'package:get/instance_manager.dart';
import 'package:personnel_management/parts/auth/data/data_sources/local/auth_local_datasource_impl.dart';
import 'package:personnel_management/parts/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:personnel_management/parts/auth/data/repositories/auth_repository_impl.dart';
import 'package:personnel_management/parts/auth/domain/use_cases/get_token_use_case.dart';
import 'package:personnel_management/parts/auth/presentation/manager/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      AuthRemoteDataSourceImpl(
        request: Get.find(),
      ),
    );
    Get.put(
      AuthRepositoryImpl(
        localDataSource: Get.find<AuthLocalDataSourceImpl>(),
        remoteDataSource: Get.find<AuthRemoteDataSourceImpl>(),
      ),
    );
    Get.put(GetTokenUseCase(repository: Get.find<AuthRepositoryImpl>()));
    Get.put(SplashController());
  }
}
