import 'package:bloc/bloc.dart';

class DetailsSelectionCubit extends Cubit<int> {
  DetailsSelectionCubit() : super(0);

  void setDetailsSelection(int value) {
    emit(value);
  }

  void reset() {
    emit(0);
  }
}
