import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  BaseOptions baseOptions = BaseOptions(
    baseUrl: 'https://myapi/v1',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );

  Future<dynamic> get(String url, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await Dio(baseOptions).get(
        url,
        queryParameters: queryParams,
      );
      if (kDebugMode) {
        print('GET $url: ${response.statusCode} ${response.data}');
      }
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? data}) async {
    try {
      final response = await Dio(baseOptions).post(
        url,
        data: data,
      );
      if (kDebugMode) {
        print('POST $url: ${response.statusCode} ${response.data}');
      }
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> put(String url, {Map<String, dynamic>? data}) async {
    try {
      final response = await Dio(baseOptions).put(
        url,
        data: data,
      );
      if (kDebugMode) {
        print('PUT $url: ${response.statusCode} ${response.data}');
      }
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> delete(String url,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await Dio(baseOptions).delete(
        url,
        queryParameters: queryParams,
      );
      if (kDebugMode) {
        print('DELETE $url: ${response.statusCode} ${response.data}');
      }
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout';
      case DioExceptionType.unknown:
        return 'Something went wrong';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout in connection';
      case DioExceptionType.badCertificate:
        return 'Unknown error';
      case DioExceptionType.connectionError:
        return 'Connection error';
      case DioExceptionType.badResponse:
        return error.response?.data['message'] ?? 'Failed to get response';
      case DioExceptionType.sendTimeout:
        return 'Send timeout in connection';
    }
  }
}
