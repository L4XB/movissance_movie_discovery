import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataCubit extends Cubit<User?> {
  UserDataCubit() : super(FirebaseAuth.instance.currentUser) {
    FirebaseAuth.instance.userChanges().listen((user) {
      emit(user);
    });
  }
}
