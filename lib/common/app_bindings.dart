import 'package:get/get.dart';
import 'package:personnel_management/common/constants.dart';
import 'package:personnel_management/core/request/request.dart';
import 'package:personnel_management/main.dart';
import 'package:personnel_management/parts/auth/data/data_sources/local/auth_local_datasource_impl.dart';
import 'package:personnel_management/parts/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:personnel_management/parts/auth/data/repositories/auth_repository_impl.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(
      () => Request(baseUrl: () => Constants.baseUrl),
      fenix: true,
    );

    await Get.putAsync(
      () => AuthLocalDataSourceImpl.build(),
      permanent: true,
    );

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

    Get.find<Request>()
      ..setTokenProvider(
        () => Get.find<AuthRepositoryImpl>().getSavedToken().fold((l) => '', (r) => r.accessToken),
      )
      ..setUnAuthorizedHandler(() async {
        final authRepo = Get.find<AuthRepositoryImpl>();
        final refreshToken = authRepo.getSavedToken().fold((l) => '', (r) => r.refreshToken);
        final res = await authRepo.refreshToken(refreshToken);

        await res.fold(
          (l) async => Setup.logout(),
          (r) async => authRepo.saveToken(r),
        );
      });
  }
}
