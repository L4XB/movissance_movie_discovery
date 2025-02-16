import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movie_provider_state.dart';

class MovieProviderCubit extends Cubit<MovieProviderState> {
  MovieProviderCubit() : super(MovieProviderInitial());
}
