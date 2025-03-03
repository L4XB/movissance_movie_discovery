import 'package:bloc/bloc.dart';
import 'package:red_line/src/common/utils/runtime_range_calculator.dart';
import 'package:red_line/src/features/home/bloc/home_movie_cubit/home_movie_cubit.dart';

class FilterCubit extends Cubit<int> {
  final HomeMovieCubit homeMovieCubit;
  FilterCubit({required this.homeMovieCubit}) : super(1);

  /// sets the filter
  /// [value] is the selected filter
  /// [value] can be
  /// [1] for all movies,
  /// [2] for movies with runtime less than 120 minutes,
  /// [3] for movies with runtime between 120 and 180 minutes,
  /// [4] for movies with runtime more than 180 minutes
  void setFilter(int value) {
    (int?, int?) runtime = RuntimeRangeCalculator.getRuntimeRange(value);
    homeMovieCubit.loadMoviesByGenre(
      1,
      minRuntime: runtime.$1,
      maxRuntime: runtime.$2,
    );

    emit(value);
  }

  /// resets the filter
  void reset() {
    emit(1);
  }
}
