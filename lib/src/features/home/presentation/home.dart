import 'package:flutter/material.dart';
import 'package:red_line/src/features/home/data/api_movie_repository.dart';
import 'package:red_line/src/features/home/data/movie_repository.dart';
import 'package:red_line/src/features/home/domain/movie_detail_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieRepository movieRepository = ApiMovieRepository();
    return Scaffold(
      body: Center(
        child: OutlinedButton(
            onPressed: () async {
              final MovieDetailModel movie =
                  await movieRepository.getMovieDetail(181808);

              print(movie.title);
            },
            child: Text("Test API call")),
      ),
    );
  }
}
