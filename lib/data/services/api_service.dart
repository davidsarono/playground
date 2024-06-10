abstract class ApiService {
  Future<Map<String, dynamic>> get(String path);
  Future<Map<String, dynamic>> post(String path, Map<String, dynamic> data);
  Future<Map<String, dynamic>> put(String path, Map<String, dynamic> data);
  Future<Map<String, dynamic>> delete(String path);
}