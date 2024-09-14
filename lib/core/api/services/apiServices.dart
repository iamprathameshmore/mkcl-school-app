abstract class Apiservices {
  Future<dynamic> getApiService(String url);
  Future<dynamic> postApiService(String url);
  Future<dynamic> putApiService(String url);
  Future<dynamic> patchApiService(String url);
  Future<dynamic> deleteApiService(String url);
}
