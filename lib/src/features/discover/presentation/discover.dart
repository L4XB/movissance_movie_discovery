import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/features/discover/bloc/swiper_content_cubit/swiper_content_cubit.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SwiperContentCubit()..loadMovies(),
        child: BlocBuilder<SwiperContentCubit, SwiperContentState>(
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
                  itemBuilder: (context, index) {
                    final movie = state.movies[index];
                    if (index == state.movies.length - 5) {
                      context
                          .read<SwiperContentCubit>()
                          .checkAndLoadMoreMovies(5);
                    }
                    return MoviePage(movie: movie);
                  },
                ),
              );
            } else if (state is SwiperContentError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No movies found'));
            }
          },
        ),
      ),
    );
  }
}

class MoviePage extends StatelessWidget {
  final MovieModel movie;

  const MoviePage({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Release Date: ${movie.releaseDate}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 20),
                  const SizedBox(width: 5),
                  Text(
                    '${movie.voteAverage}/10',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                movie.overview,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
