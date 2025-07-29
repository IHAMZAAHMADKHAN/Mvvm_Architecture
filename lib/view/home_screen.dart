// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mvvm_architecture/data/response/status.dart';
import 'package:mvvm_architecture/resource/app_colors.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';
import 'package:mvvm_architecture/viewmodel/home_view_model.dart';

import 'package:mvvm_architecture/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeviewviewmodel = HomeViewViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeviewviewmodel.fetchMovieListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userprefernce = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.buttonColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              userprefernce.removeUser().then((value) {
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) =>
            HomeViewViewModel()..fetchMovieListApi(),
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, _) {
            switch (value.movieslist.status) {
              case Status.loading:
                return CircularProgressIndicator();
              case Status.error:
                return Text(value.movieslist.message.toString());
              case Status.completed:
                return ListView.builder(
                  itemCount: value.movieslist.data!.movies!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          value.movieslist.data!.movies![index].posterurl
                              .toString(),
                          width: 50,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error);
                          },
                        ),
                        title: Text(
                          value.movieslist.data!.movies![index].title
                              .toString(),
                        ),

                        subtitle: Text(
                          value.movieslist.data!.movies![index].year.toString(),
                        ),

                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              Utils.averageRating(
                                value.movieslist.data!.movies![index].ratings!,
                              ).toStringAsFixed(1),
                            ),

                            Icon(Icons.star, color: Colors.yellow),
                          ],
                        ),
                      ),
                    );
                  },
                );
              default:
                return const SizedBox();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
