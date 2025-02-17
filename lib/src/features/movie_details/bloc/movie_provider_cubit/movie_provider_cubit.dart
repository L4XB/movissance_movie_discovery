import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/features/movie_details/data/api_provider_repository.dart';
import 'package:red_line/src/features/movie_details/data/provider_repository.dart';
import 'package:red_line/src/features/movie_details/domain/provider_model.dart';

part 'movie_provider_state.dart';

class MovieProviderCubit extends Cubit<MovieProviderState> {
  MovieProviderCubit() : super(MovieProviderInitial());

  final ProviderRepository providerRepository = ApiProviderRepository();

  void getProvider(int id) async {
    emit(MovieProviderLoading());
    try {
      ProviderModel provider = await providerRepository.getProvider(id);

      emit(MovieProviderLoaded(provider));
    } catch (e) {
      emit(MovieProviderError(e.toString()));
    }
  }
}
