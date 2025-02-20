import 'package:bloc/bloc.dart';
import 'package:red_line/src/common/utils/runtime_range_calculator.dart';
import 'package:red_line/src/features/home/bloc/home_movie_cubit/home_movie_cubit.dart';

class FilterCubit extends Cubit<int> {
  final HomeMovieCubit homeMovieCubit;
  FilterCubit({required this.homeMovieCubit}) : super(1);

  void setFilter(int value) {
    (int?, int?) runtime = RuntimeRangeCalculator.getRuntimeRange(value);
    print(value);
    print(runtime);
    homeMovieCubit.loadMoviesByGenre(
      1,
      minRuntime: runtime.$1,
      maxRuntime: runtime.$2,
    );

    emit(value);
  }
}
