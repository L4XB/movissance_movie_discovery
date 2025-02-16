import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/utils/string_formater.dart';
import 'package:red_line/src/config.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';

class GeneralInformationsAndPoster extends StatelessWidget {
  const GeneralInformationsAndPoster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoading) {
          return Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is MovieDetailsError) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is MovieDetailsLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(theMovieDatabaseApiImageBaseURL +
                        state.movie.backdropPath),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150, top: 10, right: 10),
                child: AutoSizeText(
                  state.movie.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  minFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  wrapWords: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        state.movie.releaseDate.substring(0, 4),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                    Text(
                      " ● ",
                      style: TextStyle(
                        fontSize: 5,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        state.movie.genres.first.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                    Text(
                      " ● ",
                      style: TextStyle(
                        fontSize: 5,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        StringFormater.minutesToHours(state.movie.runtime),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 150,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Icon(
                        Icons.star,
                        color: CupertinoColors.systemYellow,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, top: 5, right: 1),
                      child: Text(
                        state.movie.voteAverage.toStringAsFixed(1),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 5),
                      child: Text("/10.0",
                          style: TextStyle(
                              color: CupertinoColors.systemGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        " ● ",
                        style: TextStyle(
                          fontSize: 5,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Text("${state.movie.voteCount} votes",
                          style: TextStyle(
                              color: CupertinoColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              )
            ],
          );
        }
        return Text("Unknown state");
      },
    );
  }
}
