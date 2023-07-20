import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:point_system_mobile/src/data/models/data_model.dart';
import 'package:point_system_mobile/src/services/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_repository.g.dart';
@riverpod
DataRepository dataRepository(Ref ref) {
  final apiClient = ref.read(apiClientProvider);
  return DataRepository(apiClient: apiClient);
}

class DataRepository {
  DataRepository({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<DataModel?> fetchData() async {
    try {
      final res = await _apiClient.get('someUrl');
      if (res.statusCode == 200) {
        final data = json.decode(res.data);
        return DataModel.fromJson(data);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
