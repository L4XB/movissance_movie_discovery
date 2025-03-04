import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/features/home/domain/movie_model.dart';

void main() {
  group('MovieModel', () {
    test('fromJson creates an instance from JSON', () {
      final json = {
        'adult': false,
        'backdrop_path': 'path/to/backdrop',
        'genre_ids': [1, 2, 3],
        'id': 1,
        'original_language': 'en',
        'original_title': 'Original Title',
        'overview': 'Overview of the movie',
        'popularity': 10.0,
        'poster_path': 'path/to/poster',
        'release_date': '2021-01-01',
        'title': 'Movie Title',
        'video': false,
        'vote_average': 8.0,
        'vote_count': 1000,
      };

      final movie = MovieModel.fromJson(json);

      expect(movie.adult, false);
      expect(movie.backdropPath, 'path/to/backdrop');
      expect(movie.genreIds, [1, 2, 3]);
      expect(movie.id, 1);
      expect(movie.originalLanguage, 'en');
      expect(movie.originalTitle, 'Original Title');
      expect(movie.overview, 'Overview of the movie');
      expect(movie.popularity, 10.0);
      expect(movie.posterPath, 'path/to/poster');
      expect(movie.releaseDate, '2021-01-01');
      expect(movie.title, 'Movie Title');
      expect(movie.video, false);
      expect(movie.voteAverage, 8.0);
      expect(movie.voteCount, 1000);
    });

    test('toJson converts an instance to JSON', () {
      final movie = MovieModel(
        adult: false,
        backdropPath: 'path/to/backdrop',
        genreIds: [1, 2, 3],
        id: 1,
        originalLanguage: 'en',
        originalTitle: 'Original Title',
        overview: 'Overview of the movie',
        popularity: 10.0,
        posterPath: 'path/to/poster',
        releaseDate: '2021-01-01',
        title: 'Movie Title',
        video: false,
        voteAverage: 8.0,
        voteCount: 1000,
      );

      final json = movie.toJson();

      expect(json['adult'], false);
      expect(json['backdrop_path'], 'path/to/backdrop');
      expect(json['genre_ids'], [1, 2, 3]);
      expect(json['id'], 1);
      expect(json['original_language'], 'en');
      expect(json['original_title'], 'Original Title');
      expect(json['overview'], 'Overview of the movie');
      expect(json['popularity'], 10.0);
      expect(json['poster_path'], 'path/to/poster');
      expect(json['release_date'], '2021-01-01');
      expect(json['title'], 'Movie Title');
      expect(json['video'], false);
      expect(json['vote_average'], 8.0);
      expect(json['vote_count'], 1000);
    });
  });
}
