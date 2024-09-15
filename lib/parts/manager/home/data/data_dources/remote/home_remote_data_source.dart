import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/core/data_source/remote_data_source.dart';

abstract class HomeRemoteDataSource extends RemoteDataSource {
  const HomeRemoteDataSource({required super.request});

  Future<ResponseModel> getHomeData();
}
