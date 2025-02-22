import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/common/services/location_service.dart';
import 'package:red_line/src/common/utils/string_formater.dart';
import 'package:red_line/src/features/home/data/api_movie_repository.dart';
import 'package:red_line/src/features/home/data/movie_repository.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';
import 'package:red_line/src/features/profile/cubit/profile_cubit.dart';

part 'home_movie_state.dart';

class HomeMovieCubit extends Cubit<HomeMovieState> {
  final ProfileCubit profileCubit;
  HomeMovieCubit({required this.profileCubit}) : super(HomeMovieInitial());

  MovieRepository movieRepository = ApiMovieRepository();
  LocationService locationService = LocationService();

  void loadMovies(int page) async {
    emit(HomeMovieLoadingState());
    try {
      String? countryCode;
      if (profileCubit.state is ProfileLoaded) {
        countryCode = (profileCubit.state as ProfileLoaded).countryCode;
      }
      final movies =
          await movieRepository.getPopularMovies(page, region: countryCode);
      emit(HomeMovieLoadedState(movies, page));
    } catch (e) {
      emit(HomeMovieErrorState(e.toString()));
    }
  }

  void loadMoviesByGenre(
    int page, {
    int? genreId,
    String? year,
    int? maxRuntime,
    int? minRuntime,
  }) async {
    emit(HomeMovieLoadingState());
    try {
      String? countryCode;
      if (profileCubit.state is ProfileLoaded) {
        countryCode = (profileCubit.state as ProfileLoaded).countryCode;
      }
      final movies = await movieRepository.discoverMovies(page,
          genre: genreId,
          year: year,
          maxRuntime: maxRuntime,
          minRuntime: minRuntime,
          region: countryCode);
      emit(HomeMovieLoadedState(movies, page));
    } catch (e) {
      emit(HomeMovieErrorState(e.toString()));
    }
  }

  void loadMoviesBySearch(
    String text,
    int page, {
    String? language,
  }) async {
    emit(HomeMovieLoadingState());
    try {
      String? countryCode;
      if (profileCubit.state is ProfileLoaded) {
        countryCode = (profileCubit.state as ProfileLoaded).countryCode;
      }
      final query = StringFormater.textToQuery(text);
      final movies = await movieRepository.searchMovieByName(
        query,
        page,
        language: language,
        region: countryCode,
      );
      emit(HomeMovieLoadedState(movies, page));
    } catch (e) {
      emit(HomeMovieErrorState(e.toString()));
    }
  }
}
