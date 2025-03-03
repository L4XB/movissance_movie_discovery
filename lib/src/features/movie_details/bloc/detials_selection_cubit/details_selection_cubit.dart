import 'package:bloc/bloc.dart';

class DetailsSelectionCubit extends Cubit<int> {
  DetailsSelectionCubit() : super(0);

  /// emits the selected details index.
  /// [value] is the index of the selected details.
  /// 0: Details
  /// 1: Providers
  /// 2: Reviews
  void setDetailsSelection(int value) {
    emit(value);
  }

  /// resets the selected details index.
  void reset() {
    emit(0);
  }
}
