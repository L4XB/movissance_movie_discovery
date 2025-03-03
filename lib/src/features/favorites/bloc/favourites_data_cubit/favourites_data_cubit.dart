import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/common/utils/runtime_range_calculator.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_cubit/favourites_cubit.dart';
import 'package:red_line/src/features/favorites/data/api_favouites_data_repository.dart';
import 'package:red_line/src/features/favorites/data/favourites_data_repository.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';

part 'favourites_data_state.dart';

class FavouritesDataCubit extends Cubit<FavouritesDataState> {
  final FavouritesCubit favouritesCubit;
  final FavouritesDataRepository _favouritesDataRepository =
      ApiFavouitesDataRepository();
  List<MovieDetailModel> _originalMovies = [];

  /// [favouritesCubit] is the cubit that holds the favourites
  /// adds a listener to the [favouritesCubit] to load the data when the favourites change
  FavouritesDataCubit(this.favouritesCubit) : super(FavouritesDataInitial()) {
    favouritesCubit.stream.listen((favourites) {
      _loadData(favourites);
    });

    _loadData(favouritesCubit.state);
  }

  /// searches the movies by the [query]
  /// [selectedDurationFilter] is the selected duration filter
  /// the search is applied to the title of the movies
  void search(String query, int selectedDurationFilter) {
    if (state is FavouritesDataLoaded) {
      final List<MovieDetailModel> movies = (state as FavouritesDataLoaded)
          .movies
          .where((element) => element.title.contains(query))
          .toList();
      emit(FavouritesDataLoaded(movies));
    }
  }

  /// applies a filter to the movies
  /// [selectedDurationFilter] is the selected duration filter
  /// the filter is applied to the runtime of the movies
  void applyFilter(int selectedDurationFilter) {
    (int?, int?) runtimeRange =
        RuntimeRangeCalculator.getRuntimeRange(selectedDurationFilter);
    if (state is FavouritesDataLoaded) {
      final List<MovieDetailModel> movies = _originalMovies
          .where((element) =>
              (runtimeRange.$1 == null ||
                  element.runtime >= runtimeRange.$1!) &&
              (runtimeRange.$2 == null || element.runtime <= runtimeRange.$2!))
          .toList();
      emit(FavouritesDataLoaded(movies));
    }
  }

  /// resets the filter
  void resetFilter() {
    if (state is FavouritesDataLoaded) {
      emit(FavouritesDataLoaded(_originalMovies));
    }
  }

  /// loads the data of the favourites from the [FavoritesDataRepository]
  /// [favourites] is a list of movie ids
  /// emits the data to the current state
  void _loadData(List<int> favourites) async {
    emit(FavouritesDataLoading());
    try {
      final List<MovieDetailModel> movies =
          await _favouritesDataRepository.getFavouritesData(favourites);
      _originalMovies = movies;
      emit(FavouritesDataLoaded(movies));
    } catch (e) {
      emit(FavouritesDataError(e.toString()));
    }
  }

  /// resets the cubit
  void reset() {
    emit(FavouritesDataInitial());
  }
}
