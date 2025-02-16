import 'package:flutter/material.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details_content.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailsContent(),
    );
  }
}
