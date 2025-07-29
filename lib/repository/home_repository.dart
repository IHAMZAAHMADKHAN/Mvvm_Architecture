import 'package:mvvm_architecture/data/network/base_api_services.dart';
import 'package:mvvm_architecture/data/network/network_api_services.dart';
import 'package:mvvm_architecture/models/movies_list_model.dart';
import 'package:mvvm_architecture/resource/app_url.dart';

class HomeRepository {
  Future<movieListModel> fatchmovieListModel() async {
    final BaseApiServices _apiServices = NetworkApiService();
    try {
      dynamic response = await _apiServices.getGetApiResponse(
        AppUrl.movielistendPoint,
      );
      return response = movieListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
