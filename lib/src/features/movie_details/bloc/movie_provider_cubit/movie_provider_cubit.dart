import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/features/movie_details/data/api_provider_repository.dart';
import 'package:red_line/src/features/movie_details/data/provider_repository.dart';
import 'package:red_line/src/features/movie_details/domain/provider_model.dart';

part 'movie_provider_state.dart';

class MovieProviderCubit extends Cubit<MovieProviderState> {
  MovieProviderCubit() : super(MovieProviderInitial());

  final ProviderRepository providerRepository = ApiProviderRepository();

  /// loads the provider details from the API
  /// [id] is the movie id
  void getProvider(int id) async {
    emit(MovieProviderLoading());
    try {
      ProviderModel provider = await providerRepository.getProvider(id);

      emit(MovieProviderLoaded(provider));
    } catch (e) {
      emit(MovieProviderError(e.toString()));
    }
  }

  /// resets the provider details
  void reset() {
    emit(MovieProviderInitial());
  }
}
