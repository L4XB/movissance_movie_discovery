import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  /// [ConnectivityCubit] constructor
  /// emits [ConnectivityConnected] when the device is connected to the internet
  /// emits [ConnectivityDisconnected] when the device is disconnected from the internet
  ConnectivityCubit() : super(ConnectivityInitial()) {
    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      if (event.contains(ConnectivityResult.none)) {
        emit(ConnectivityDisconnected());
      } else if (event.contains(ConnectivityResult.mobile) ||
          event.contains(ConnectivityResult.wifi)) {
        emit(ConnectivityConnected());
      } else {
        emit(ConnectivityDisconnected());
      }
    });
  }

  /// close the subscription
  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
