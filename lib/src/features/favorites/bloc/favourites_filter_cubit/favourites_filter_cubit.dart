import 'package:bloc/bloc.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_data_cubit/favourites_data_cubit.dart';

class FavouritesFilterCubit extends Cubit<int> {
  final FavouritesDataCubit favouritesDataCubit;
  FavouritesFilterCubit({required this.favouritesDataCubit}) : super(1);

  /// sets the filter
  /// [value] is the selected filter
  /// [value] can be
  /// [1] for all movies,
  /// [2] for movies with runtime less than 120 minutes,
  /// [3] for movies with runtime between 120 and 180 minutes,
  /// [4] for movies with runtime more than 180 minutes
  void setFilter(int value) {
    emit(value);
    favouritesDataCubit.resetFilter();
    favouritesDataCubit.applyFilter(value);
  }

  /// resets the filter
  void reset() {
    emit(1);
  }

  /// resets the filter in the [favouritesDataCubit]
  void resetFilter() {
    favouritesDataCubit.resetFilter();
  }
}
