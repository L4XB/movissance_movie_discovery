import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/features/home/bloc/home_bloc.dart';
import 'package:red_line/src/features/home/presentation/widgets/home_screen_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeInitialDataLoadedState) {
              return HomeScreenContent(
                genres: state.genres,
                movies: state.movies,
              );
            } else if (state is HomeErrorState) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Unbekannter Zustand'));
          },
        ),
      ),
    );
  }

  ListView newMethod(HomeInitialDataLoadedState state) {
    return ListView.builder(
      itemCount: state.movies.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Image.network(
              "https://image.tmdb.org/t/p/w500${state.movies[index].posterPath}"),
        );
      },
    );
  }
}
