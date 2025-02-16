import 'package:bloc/bloc.dart';

class FilterCubit extends Cubit<int> {
  FilterCubit() : super(1);

  void setFilter(int value) {
    emit(value);
  }
}
