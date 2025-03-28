import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/config/config.dart';
import 'package:red_line/src/common/cubit/connectivity_cubit.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/common/services/firebase_messaging_service.dart';
import 'package:red_line/src/common/theme/dark_theme.dart';
import 'package:red_line/src/common/theme/light_theme.dart';
import 'package:red_line/src/common/widgets/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/features/auth/cubit/user_data_cubit.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/auth/data/firebase_auth_repository.dart';
import 'package:red_line/src/features/auth/presentation/login/login.dart';
import 'package:red_line/src/features/discover/cubit/swiper_content_cubit.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_cubit/favourites_cubit.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_data_cubit/favourites_data_cubit.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_filter_cubit/favourites_filter_cubit.dart';
import 'package:red_line/src/features/home/bloc/filter_cubit/filter_cubit.dart';
import 'package:red_line/src/features/home/bloc/home_genre_cubit/home_genre_cubit.dart';
import 'package:red_line/src/features/home/bloc/home_movie_cubit/home_movie_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/detials_selection_cubit/details_selection_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_provider_cubit/movie_provider_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_reviews_cubit/movie_reviews_cubit.dart';
import 'package:red_line/src/features/profile/cubit/profile_cubit.dart';

class App extends StatelessWidget {
  App({super.key});

  final PersistentTabController controller = PersistentTabController();
  final AuthRepository authRepository = FirebaseAuthRepository();

  @override
  Widget build(BuildContext context) {
    /// ----------------- Widget ----------------- ///
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeGenreCubit>(
            create: (context) =>
                HomeGenreCubit()..loadGenres(standartLoadingPage)),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit()..loadProfileSettings(),
        ),
        BlocProvider<HomeMovieCubit>(
            create: (context) =>
                HomeMovieCubit(profileCubit: context.read<ProfileCubit>())
                  ..loadMovies(standartLoadingPage)),
        BlocProvider<UserDataCubit>(
          create: (context) => UserDataCubit(),
        ),
        BlocProvider<FilterCubit>(
            create: (context) =>
                FilterCubit(homeMovieCubit: context.read<HomeMovieCubit>())),
        BlocProvider<MovieDetailsCubit>(
            create: (context) => MovieDetailsCubit()),
        BlocProvider<FavouritesCubit>(
            create: (context) => FavouritesCubit(context.read<UserDataCubit>())
              ..loadInitialFavourites()),
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
          create: (context) => FavouritesFilterCubit(
              favouritesDataCubit: context.read<FavouritesDataCubit>()),
        ),
        BlocProvider<SwiperContentCubit>(
          create: (context) => SwiperContentCubit()..loadMovies(),
        ),
        BlocProvider<ConnectivityCubit>(
            create: (context) => ConnectivityCubit()),
      ],
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          /// set up firebase messaging service and schedule notification if enabled
          if (state is ProfileLoaded) {
            final FirebaseMessagingService firebaseMessagingService =
                FirebaseMessagingService();
            firebaseMessagingService.initialize();
            if (state.isNotificationsEnabled) {
              firebaseMessagingService.scheduleNotification(10, 0);
            }

            return MaterialApp(
              /// set up theme and set the theme mode based on the profile settings
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              debugShowCheckedModeBanner: false,

              /// show login or home screen based on the firebase auth state
              home: StreamBuilder(

                  /// listen to the firebase auth state
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
            );
          } else {
            final themeExtension =
                Theme.of(context).extension<CustomThemeColorsExtension>();
            return Center(
              child: CircularProgressIndicator(
                color: themeExtension?.primaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
