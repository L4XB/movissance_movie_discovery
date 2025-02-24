import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:red_line/src/features/home/bloc/filter_cubit/filter_cubit.dart';
import 'package:red_line/src/features/home/bloc/home_movie_cubit/home_movie_cubit.dart';

class MockHomeMovieCubit extends Mock implements HomeMovieCubit {}

void main() {
  late FilterCubit filterCubit;
  late MockHomeMovieCubit mockHomeMovieCubit;

  setUp(() {
    mockHomeMovieCubit = MockHomeMovieCubit();
    filterCubit = FilterCubit(homeMovieCubit: mockHomeMovieCubit);
  });

  tearDown(() {
    filterCubit.close();
  });

  test('initial state is 1', () {
    expect(filterCubit.state, 1);
  });
  test('reset emits 1', () {
    filterCubit.setFilter(2);
    filterCubit.reset();

    expect(filterCubit.state, 1);
  });
}
