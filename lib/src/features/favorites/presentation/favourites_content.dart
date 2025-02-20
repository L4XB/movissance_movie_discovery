import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_data_cubit/favourites_data_cubit.dart';
import 'package:red_line/src/features/favorites/presentation/widgets/favourits_element.dart';

class FavouritesContent extends StatelessWidget {
  const FavouritesContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<FavouritesDataCubit, FavouritesDataState>(
      builder: (context, state) {
        if (state is FavouritesDataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FavouritesDataLoaded) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: size.height * 0.0125),
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return FavouritsElement(movie: movie);
              },
            ),
          );
        }
        return const Text("Unknown state");
      },
    );
  }
}
