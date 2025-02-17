import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/features/favorites/bloc/favourites_cubit/favourites_cubit.dart';
import 'package:red_line/src/features/favorites/data/api_favouites_data_repository.dart';
import 'package:red_line/src/features/favorites/data/favourites_data_repository.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';

part 'favourites_data_state.dart';

class FavouritesDataCubit extends Cubit<FavouritesDataState> {
  final FavouritesCubit favouritesCubit;
  final FavouritesDataRepository _favouritesDataRepository =
      ApiFavouitesDataRepository();

  FavouritesDataCubit(this.favouritesCubit) : super(FavouritesDataInitial()) {
    favouritesCubit.stream.listen((favourites) {
      _loadData(favourites);
    });

    _loadData(favouritesCubit.state);
  }

  void _loadData(List<int> favourites) async {
    emit(FavouritesDataLoading());
    try {
      final List<MovieModel> movies =
          await _favouritesDataRepository.getFavouritesData(favourites);
      emit(FavouritesDataLoaded(movies));
    } catch (e) {
      emit(FavouritesDataError(e.toString()));
    }
  }
}
