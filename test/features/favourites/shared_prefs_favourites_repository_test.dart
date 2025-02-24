import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/features/favorites/data/shared_preferences_favourites_reposiotry.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferencesFavouritesReposiotry repository;
  late SharedPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    repository = SharedPreferencesFavouritesReposiotry();
  });

  test('addFavourite should add a movie ID to favourites', () async {
    await repository.addFavourite(1);
    final favourites = prefs
        .getStringList(SharedPreferencesFavouritesReposiotry.favouritesKey);
    expect(favourites, contains('1'));
  });

  test('getFavourites should return list of favourite movie IDs', () async {
    await prefs.setStringList(
        SharedPreferencesFavouritesReposiotry.favouritesKey, ['1', '2']);
    final favourites = await repository.getFavourites();
    expect(favourites, [1, 2]);
  });

  test('removeFavourite should remove a movie ID from favourites', () async {
    await prefs.setStringList(
        SharedPreferencesFavouritesReposiotry.favouritesKey, ['1', '2']);
    await repository.removeFavourite(1);
    final favourites = prefs
        .getStringList(SharedPreferencesFavouritesReposiotry.favouritesKey);
    expect(favourites, isNot(contains('1')));
    expect(favourites, contains('2'));
  });

  test('addFavourite should not add duplicate movie IDs', () async {
    await repository.addFavourite(1);
    await repository.addFavourite(1);
    final favourites = prefs
        .getStringList(SharedPreferencesFavouritesReposiotry.favouritesKey);
    expect(favourites, ['1']);
  });

  test('getFavourites should return an empty list if no favourites are set',
      () async {
    final favourites = await repository.getFavourites();
    expect(favourites, isEmpty);
  });
}
