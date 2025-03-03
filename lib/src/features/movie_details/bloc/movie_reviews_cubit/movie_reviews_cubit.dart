import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/features/movie_details/data/api_reviews_repository.dart';
import 'package:red_line/src/features/movie_details/data/reviews_repository.dart';
import 'package:red_line/src/features/movie_details/domain/review_model.dart';

part 'movie_reviews_state.dart';

class MovieReviewsCubit extends Cubit<MovieReviewsState> {
  MovieReviewsCubit() : super(MovieReviewsInitial());

  final ReviewsRepository _reviewsRepository = ApiReviewsRepository();

  /// loads the reviews of the movie from the API
  /// [movieId] is the movie id
  Future<void> getReviews(int movieId) async {
    try {
      emit(MovieReviewsLoading());
      final List<ReviewModel> reviews =
          await _reviewsRepository.getReviews(movieId);
      emit(MovieReviewsLoaded(reviews));
    } catch (e) {
      emit(MovieReviewsError(e.toString()));
    }
  }

  /// resets the reviews
  void reset() {
    emit(MovieReviewsInitial());
  }
}
