import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/features/discover/cubit/swiper_content_cubit.dart';
import 'package:red_line/src/features/discover/presentation/widgets/movie_page.dart';

class DiscoverPageContent extends StatelessWidget {
  final PersistentTabController controller;
  const DiscoverPageContent({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwiperContentCubit, SwiperContentState>(
      builder: (context, state) {
        if (state is SwiperContentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SwiperContentLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                context.read<SwiperContentCubit>().loadMoreMovies();
              }
              return false;
            },
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.movies.length,
              onPageChanged: (index) {
                context.read<SwiperContentCubit>().updateCurrentIndex(index);
              },
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                if (index == state.movies.length - 5) {
                  context.read<SwiperContentCubit>().checkAndLoadMoreMovies(5);
                }
                return MoviePage(movie: movie, controller: controller);
              },
            ),
          );
        } else if (state is SwiperContentError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No movies found'));
        }
      },
    );
  }
}
