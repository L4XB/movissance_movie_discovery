import 'package:flutter/material.dart';
import 'package:red_line/src/common/config/config.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/movie_details/domain/review_model.dart';

class ReviewBox extends StatelessWidget {
  final ReviewModel review;

  const ReviewBox({required this.review, super.key});

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.009, horizontal: size.width * 0.04),
      child: Container(
        decoration: BoxDecoration(
          color: themeExtension?.inputFieldFillColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: themeExtension?.boxshadowColor as Color,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: review.authorAvatarPath == ""
                        ? AssetImage("assets/images/placeholder.png")
                        : NetworkImage(theMovieDatabaseApiImageBaseURL +
                            review.authorAvatarPath),
                    radius: 20,
                    onBackgroundImageError: (_, __) {},
                  ),
                  SizedBox(width: size.width * 0.0225),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.authorName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: scaler.scale(16),
                          color: themeExtension?.mainTextColor,
                        ),
                      ),
                      Text(
                        '@${review.authorUsername}',
                        style: TextStyle(
                          color: themeExtension?.secondaryLabelColor,
                          fontSize: scaler.scale(14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.012),
              Text(
                review.content,
                style: TextStyle(
                  fontSize: scaler.scale(14),
                  color: themeExtension?.mainTextColor,
                ),
              ),
              SizedBox(height: size.height * 0.012),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < review.rating ? Icons.star : Icons.star_border,
                    color: themeExtension?.starIconColor,
                    size: scaler.scale(20),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
