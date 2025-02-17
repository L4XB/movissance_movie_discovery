import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_reviews_cubit/movie_reviews_cubit.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details/movie_details_sections/widgets/review_box.dart';

class MovieReviewSection extends StatelessWidget {
  const MovieReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieReviewsCubit, MovieReviewsState>(
      builder: (context, state) {
        if (state is MovieReviewsLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        if (state is MovieReviewsError) {
          return Text(state.message);
        }
        if (state is MovieReviewsLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: state.reviews.length + 1,
            itemBuilder: (context, index) {
              if (index == state.reviews.length) {
                return SizedBoxExtension.height(60);
              }
              final review = state.reviews[index];
              return ReviewBox(review: review);
            },
          );
        }
        return Text("Unknown state");
      },
    );
  }
}
