
import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/core/data_source/remote_data_source.dart';
import 'package:personnel_management/parts/shift/domain/params/shift_param.dart';

abstract class ShiftRemoteDataSource extends RemoteDataSource {
  const ShiftRemoteDataSource({required super.request});

  Future<ResponseModel> sampleRequest(ShiftParam param);
}
