import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/core/data_source/remote_data_source.dart';
import 'package:personnel_management/parts/shift/domain/params/create_shift_param.dart';
import 'package:personnel_management/parts/shift/domain/params/get_shift_list_param.dart';

abstract class ShiftRemoteDataSource extends RemoteDataSource {
  const ShiftRemoteDataSource({required super.request});

  Future<ResponseModel> createShift(CreateShiftParam param);

  Future<ResponseModel> getShiftList(GetShiftListParam param);
}
