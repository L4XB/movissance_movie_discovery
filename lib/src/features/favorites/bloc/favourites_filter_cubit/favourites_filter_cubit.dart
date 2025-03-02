import 'package:bloc/bloc.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_data_cubit/favourites_data_cubit.dart';

class FavouritesFilterCubit extends Cubit<int> {
  final FavouritesDataCubit favouritesDataCubit;
  FavouritesFilterCubit({required this.favouritesDataCubit}) : super(1);

  void setFilter(int value) {
    emit(value);
    favouritesDataCubit.resetFilter();
    favouritesDataCubit.applyFilter(value);
  }

  void reset() {
    emit(1);
  }

  void resetFilter() {
    favouritesDataCubit.resetFilter();
  }
}
