import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/features/home/domain/genre_model.dart';
import 'package:red_line/src/features/home/domain/production_country_model.dart';
import 'package:red_line/src/features/home/domain/spoken_languages_model.dart';
import 'package:red_line/src/features/movie_details/domain/movie_detail_model.dart';
import 'package:red_line/src/features/movie_details/domain/provider_model.dart';

void main() {
  group('MovieDetailModel', () {
    test('fromJson creates an instance from JSON', () {
      final json = {
        'adult': false,
        'backdrop_path': 'path/to/backdrop',
        'budget': 1000000,
        'genres': [
          {'id': 1, 'name': 'Action'}
        ],
        'homepage': 'http://example.com',
        'id': 1,
        'imdb_id': 'tt1234567',
        'origin_country': ['US'],
        'original_language': 'en',
        'original_title': 'Original Title',
        'overview': 'Overview of the movie',
        'popularity': 10.0,
        'poster_path': 'path/to/poster',
        'production_companies': [
          {
            'logo_path': '',
            'provider_id': 1,
            'provider_name': 'Company',
            'display_priority': 0
          }
        ],
        'production_countries': [
          {'iso_3166_1': 'US', 'name': 'United States'}
        ],
        'release_date': '2021-01-01',
        'revenue': 1000000,
        'runtime': 120,
        'spoken_languages': [
          {'iso_639_1': 'en', 'name': 'English', 'english_name': 'English'}
        ],
        'status': 'Released',
        'tagline': 'Tagline of the movie',
        'title': 'Movie Title',
        'video': false,
        'vote_average': 8.0,
        'vote_count': 1000,
      };

      final movieDetail = MovieDetailModel.fromJson(json);

      expect(movieDetail.adult, false);
      expect(movieDetail.backdropPath, 'path/to/backdrop');
      expect(movieDetail.budget, 1000000);
      expect(movieDetail.genres.first.name, 'Action');
      expect(movieDetail.homepage, 'http://example.com');
      expect(movieDetail.id, 1);
      expect(movieDetail.imdbId, 'tt1234567');
      expect(movieDetail.originCountry.first, 'US');
      expect(movieDetail.originalLanguage, 'en');
      expect(movieDetail.originalTitle, 'Original Title');
      expect(movieDetail.overview, 'Overview of the movie');
      expect(movieDetail.popularity, 10.0);
      expect(movieDetail.posterPath, 'path/to/poster');
      expect(movieDetail.productionCompanies.first.providerName, 'Company');
      expect(movieDetail.productionCountries.first.name, 'United States');
      expect(movieDetail.releaseDate, '2021-01-01');
      expect(movieDetail.revenue, 1000000);
      expect(movieDetail.runtime, 120);
      expect(movieDetail.spokenLanguages.first.name, 'English');
      expect(movieDetail.status, 'Released');
      expect(movieDetail.tagline, 'Tagline of the movie');
      expect(movieDetail.title, 'Movie Title');
      expect(movieDetail.video, false);
      expect(movieDetail.voteAverage, 8.0);
      expect(movieDetail.voteCount, 1000);
    });

    test('toJson converts an instance to JSON', () {
      final movieDetail = MovieDetailModel(
        adult: false,
        backdropPath: 'path/to/backdrop',
        budget: 1000000,
        genres: [GenreModel(id: 1, name: 'Action')],
        homepage: 'http://example.com',
        id: 1,
        imdbId: 'tt1234567',
        originCountry: ['US'],
        originalLanguage: 'en',
        originalTitle: 'Original Title',
        overview: 'Overview of the movie',
        popularity: 10.0,
        posterPath: 'path/to/poster',
        productionCompanies: [
          Provider(
            logoPath: '',
            providerId: 1,
            providerName: 'Company',
            displayPriority: 0,
          )
        ],
        productionCountries: [
          ProductionCountryModel(iso31661: 'US', name: 'United States')
        ],
        releaseDate: '2021-01-01',
        revenue: 1000000,
        runtime: 120,
        spokenLanguages: [
          SpokenLanguageModel(
              englishName: 'English', iso6391: 'en', name: 'English')
        ],
        status: 'Released',
        tagline: 'Tagline of the movie',
        title: 'Movie Title',
        video: false,
        voteAverage: 8.0,
        voteCount: 1000,
      );

      final json = movieDetail.toJson();

      expect(json['adult'], false);
      expect(json['backdrop_path'], 'path/to/backdrop');
      expect(json['budget'], 1000000);
      expect(json['genres'].first['name'], 'Action');
      expect(json['homepage'], 'http://example.com');
      expect(json['id'], 1);
      expect(json['imdb_id'], 'tt1234567');
      expect(json['origin_country'].first, 'US');
      expect(json['original_language'], 'en');
      expect(json['original_title'], 'Original Title');
      expect(json['overview'], 'Overview of the movie');
      expect(json['popularity'], 10.0);
      expect(json['poster_path'], 'path/to/poster');
      expect(json['production_companies'].first['provider_name'], 'Company');
      expect(json['production_countries'].first['name'], 'United States');
      expect(json['release_date'], '2021-01-01');
      expect(json['revenue'], 1000000);
      expect(json['runtime'], 120);
      expect(json['spoken_languages'].first['name'], 'English');
      expect(json['status'], 'Released');
      expect(json['tagline'], 'Tagline of the movie');
      expect(json['title'], 'Movie Title');
      expect(json['video'], false);
      expect(json['vote_average'], 8.0);
      expect(json['vote_count'], 1000);
    });
  });
}
