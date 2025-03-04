import 'package:flutter_test/flutter_test.dart';
import 'package:red_line/src/features/movie_details/domain/review_model.dart';

void main() {
  group('ReviewModel', () {
    test('fromJson creates an instance from JSON', () {
      final json = {
        'author': 'Author',
        'author_details': {
          'name': 'Author Name',
          'username': 'AuthorUsername',
          'avatar_path': 'path/to/avatar',
          'rating': 4.5
        },
        'content': 'Review content'
      };

      final reviewModel = ReviewModel.fromJson(json);

      expect(reviewModel.author, 'Author');
      expect(reviewModel.authorName, 'Author Name');
      expect(reviewModel.authorUsername, 'AuthorUsername');
      expect(reviewModel.authorAvatarPath, 'path/to/avatar');
      expect(reviewModel.rating, 4.5);
      expect(reviewModel.content, 'Review content');
    });
  });
}
