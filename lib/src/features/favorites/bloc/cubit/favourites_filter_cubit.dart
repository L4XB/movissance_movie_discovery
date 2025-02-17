import 'package:bloc/bloc.dart';

class FavouritesFilterCubit extends Cubit<int> {
  FavouritesFilterCubit() : super(1);

  void setFilter(int value) {
    emit(value);
  }
}
