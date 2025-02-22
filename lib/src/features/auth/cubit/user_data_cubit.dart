import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataCubit extends Cubit<User?> {
  late final StreamSubscription<User?> _userSubscription;

  UserDataCubit() : super(FirebaseAuth.instance.currentUser) {
    _userSubscription = FirebaseAuth.instance.userChanges().listen((user) {
      emit(user);
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
