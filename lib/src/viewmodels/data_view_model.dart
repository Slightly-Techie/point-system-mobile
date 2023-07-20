import 'package:point_system_mobile/src/data/models/data_model.dart';
import 'package:point_system_mobile/src/data/repository/data_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_view_model.g.dart';

@riverpod
class DataViewModel extends _$DataViewModel {
  @override
  FutureOr<DataModel?> build() async {
    return fetchData();
  }
  

  Future<DataModel?> fetchData() async {
    final dataRepo = ref.read(dataRepositoryProvider);
    final data = dataRepo.fetchData();
    return data;
  }
}
