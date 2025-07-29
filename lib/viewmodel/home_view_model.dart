import 'package:flutter/material.dart';
import 'package:mvvm_architecture/data/response/api_response.dart';
import 'package:mvvm_architecture/models/movies_list_model.dart';
import 'package:mvvm_architecture/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<movieListModel> movieslist = ApiResponse.loading();

  void setMovieList(ApiResponse<movieListModel> response) {
    movieslist = response;
    notifyListeners();
  }

  Future<void> fetchMovieListApi() async {
    setMovieList(ApiResponse.loading());

    try {
      final value = await _myRepo
          .fatchmovieListModel(); // Fix typo in method name if needed
      setMovieList(ApiResponse.completed(value));
    } catch (error) {
      setMovieList(ApiResponse.error(error.toString()));
    }
  }
}
