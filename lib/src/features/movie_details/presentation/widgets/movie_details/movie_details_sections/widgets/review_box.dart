import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_line/src/config.dart';
import 'package:red_line/src/features/movie_details/domain/review_model.dart';

class ReviewBox extends StatelessWidget {
  final ReviewModel review;

  const ReviewBox({required this.review, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.009, horizontal: size.width * 0.04),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
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
                        ),
                      ),
                      Text(
                        '@${review.authorUsername}',
                        style: TextStyle(
                          color: Colors.grey,
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
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: size.height * 0.012),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < review.rating ? Icons.star : Icons.star_border,
                    color: CupertinoColors.systemYellow,
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
