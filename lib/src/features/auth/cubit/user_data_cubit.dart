import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataCubit extends Cubit<User?> {
  /// streamSubscription to listen to the user changes.
  late final StreamSubscription<User?> _userSubscription;

  /// emits the current user when the auth state changes.
  /// if the user is signed out, it will emit [NULL].
  UserDataCubit() : super(FirebaseAuth.instance.currentUser) {
    _userSubscription = FirebaseAuth.instance.userChanges().listen((user) {
      emit(user);
    });
  }

  /// closes the streamSubscription.
  /// this should be called when the cubit is no longer needed.
  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
