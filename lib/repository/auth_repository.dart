import 'package:mvvm_architecture/data/network/base_api_services.dart';
import 'package:mvvm_architecture/data/network/network_api_services.dart';
import 'package:mvvm_architecture/resource/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.loginEndPoint,
        data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registorEndPoint(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.registerEndPoint,
        data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
