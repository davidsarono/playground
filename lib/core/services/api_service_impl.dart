import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:playground/data/services/api_service.dart';

@LazySingleton(as: ApiService)
class ApiServiceImpl extends ApiService {
  final Dio _dio;

  ApiServiceImpl(this._dio);

  @override
  Future<Map<String, dynamic>> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> post(String path, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> put(String path, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(path, data: data);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }
}