import 'package:dio/dio.dart';
import 'package:red_line/src/common/config/config.dart';
import 'package:red_line/src/features/movie_details/data/reviews_repository.dart';
import 'package:red_line/src/features/movie_details/domain/review_model.dart';

class ApiReviewsRepository implements ReviewsRepository {
  @override
  Future<List<ReviewModel>> getReviews(int movieId) async {
    final Response response;

    response = await Dio().get(
        "$theMovieDatabaseApiBaseURL/movie/$movieId/reviews",
        queryParameters: {
          "api_key": theMovieDatabaseApiKey,
        });

    if (response.statusCode == 200 || response.statusCode == 201) {
      return (response.data["results"] as List)
          .map((e) => ReviewModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load reviews");
    }
  }
}
