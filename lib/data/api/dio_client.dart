// ignore_for_file: strict_raw_type, inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:wizr/data/api/endpoints.dart';

class DioClient {
  // injecting dio instance
  DioClient(this._dio);

  void initialize() {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.headers = {Headers.contentTypeHeader: 'application/json'}
      ..options.responseType = ResponseType.json
      ..interceptors.addAll([]);
  }

  // dio instance
  final Dio _dio;
  void addInterceptor(InterceptorsWrapper interceptorsWrapper) {
    _dio.interceptors.add(interceptorsWrapper);
  }

  void removeInterceptors() {
    _dio.interceptors.clear();
  }

  void updateAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // Get:-----------------------------------------------------------------------
  Future<Response<Map<String, dynamic>>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get<Map<String, dynamic>>(
        url,
        queryParameters: queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }

  DioClient withBaseUrl(String base) {
    _dio.options.baseUrl = base;
    return DioClient(_dio);
  }

  // Post:----------------------------------------------------------------------
  Future<Response<Map<String, dynamic>>> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.post<Map<String, dynamic>>(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Patch:----------------------------------------------
  Future<Response<Map<String, dynamic>>> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.patch<Map<String, dynamic>>(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response<Map<String, dynamic>>> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.put<Map<String, dynamic>>(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<Response<Map<String, dynamic>>> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.delete<Map<String, dynamic>>(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Get:-----------------------------------------------------------------------
  Future<Response<Map<String, dynamic>>> getWithCustomUrl(
    String baseUrl,
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final customDio = _dio;
      customDio.options.baseUrl = baseUrl;
      return await customDio.get<Map<String, dynamic>>(
        url,
        queryParameters: queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response<Map<String, dynamic>>> postWithCustomUrl(
    String baseUrl,
    String uri, {
    dynamic data,
  }) async {
    try {
      final customDio = _dio;
      customDio.options.baseUrl = baseUrl;
      return await customDio.post<Map<String, dynamic>>(
        uri,
        data: data,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<Map<String, dynamic>>> putWithCustomUrl(
    String baseUrl,
    String uri, {
    dynamic data,
  }) async {
    try {
      final customDio = _dio;
      customDio.options.baseUrl = baseUrl;
      return await customDio.put<Map<String, dynamic>>(
        uri,
        data: data,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Patch
  Future<Response<Map<String, dynamic>>> patchWithCustomUrl(
    String baseUrl,
    String uri, {
    dynamic data,
  }) async {
    try {
      final customDio = _dio;
      customDio.options.baseUrl = baseUrl;
      return await customDio.patch<Map<String, dynamic>>(
        uri,
        data: data,
      );
    } catch (e) {
      rethrow;
    }
  }
}
