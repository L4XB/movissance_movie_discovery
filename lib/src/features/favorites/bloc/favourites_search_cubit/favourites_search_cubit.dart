import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favourites_search_state.dart';

class FavouritesSearchCubit extends Cubit<FavouritesSearchState> {
  FavouritesSearchCubit() : super(FavouritesSearchInitial());
}
