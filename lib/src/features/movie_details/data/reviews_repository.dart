import 'package:red_line/src/features/movie_details/domain/review_model.dart';

abstract class ReviewsRepository {
  Future<List<ReviewModel>> getReviews(int movieId);
}
