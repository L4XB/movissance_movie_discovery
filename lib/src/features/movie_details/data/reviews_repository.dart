import 'package:red_line/src/features/movie_details/domain/review_model.dart';

abstract class ReviewsRepository {
  /// fetches the reviews of the movie from the API
  /// [movieId] is the movie id
  /// [returns] a list of [ReviewModel]
  Future<List<ReviewModel>> getReviews(int movieId);
}
