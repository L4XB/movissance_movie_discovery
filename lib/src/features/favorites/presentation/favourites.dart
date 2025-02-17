import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_data_cubit/favourites_data_cubit.dart';
import 'package:red_line/src/features/favorites/presentation/widgets/favourites_search_field_widget.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBoxExtension.height(60),
          FavouritesSearchFieldWidget(),
          BlocBuilder<FavouritesDataCubit, FavouritesDataState>(
            builder: (context, state) {
              if (state is FavouritesDataLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is FavouritesDataLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      final movie = state.movies[index];
                      return ListTile(
                        title: Text(movie.title),
                        subtitle: Text(movie.overview),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {},
                        ),
                      );
                    },
                  ),
                );
              }
              return const Text("Unknown state");
            },
          )
        ],
      ),
    );
  }
}
