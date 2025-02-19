import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/widgets/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/config.dart';
import 'package:red_line/src/features/auth/cubit/user_data_cubit.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/auth/data/firebase_auth_repository.dart';
import 'package:red_line/src/features/auth/presentation/login/login.dart';
import 'package:red_line/src/features/discover/cubit/swiper_content_cubit.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_cubit/favourites_cubit.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_data_cubit/favourites_data_cubit.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_filter_cubit/favourites_filter_cubit.dart';
import 'package:red_line/src/features/home/bloc/home_genre_cubit/home_genre_cubit.dart';
import 'package:red_line/src/features/home/bloc/home_movie_cubit/home_movie_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/detials_selection_cubit/details_selection_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/filter_cubit/filter_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_provider_cubit/movie_provider_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_reviews_cubit/movie_reviews_cubit.dart';

class App extends StatelessWidget {
  App({super.key});

  final PersistentTabController controller = PersistentTabController();
  final AuthRepository authRepository = FirebaseAuthRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeGenreCubit>(
            create: (context) =>
                HomeGenreCubit()..loadGenres(standartLoadingPage)),
        BlocProvider<HomeMovieCubit>(
            create: (context) =>
                HomeMovieCubit()..loadMovies(standartLoadingPage)),
        BlocProvider<FilterCubit>(create: (context) => FilterCubit()),
        BlocProvider<MovieDetailsCubit>(
            create: (context) => MovieDetailsCubit()),
        BlocProvider<FavouritesCubit>(
            create: (context) => FavouritesCubit()..loadStoredFavourites()),
        BlocProvider<DetailsSelectionCubit>(
          create: (context) => DetailsSelectionCubit(),
        ),
        BlocProvider<MovieProviderCubit>(
          create: (context) => MovieProviderCubit(),
        ),
        BlocProvider<MovieReviewsCubit>(
          create: (context) => MovieReviewsCubit(),
        ),
        BlocProvider<FavouritesDataCubit>(
          create: (context) =>
              FavouritesDataCubit(context.read<FavouritesCubit>()),
        ),
        BlocProvider<FavouritesFilterCubit>(
          create: (context) => FavouritesFilterCubit(),
        ),
        BlocProvider<SwiperContentCubit>(
          create: (context) => SwiperContentCubit()..loadMovies(),
        ),
        BlocProvider<UserDataCubit>(
          create: (context) => UserDataCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: authRepository.onAuthStateChanged,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return PersistentBottomNavBar(
                  authRepository: authRepository,
                  controller: controller,
                );
              } else {
                return LoginScreen(
                  authRepository: authRepository,
                );
              }
            }),
      ),
    );
  }
}
