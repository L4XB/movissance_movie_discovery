import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/widgets/back_button.dart';
import 'package:red_line/src/config.dart';
import 'package:red_line/src/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/movie_details/bloc/detials_selection_cubit/details_selection_cubit.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations/overlay_image.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/general_informations_and_poster.dart';

class MovieDetailsContent extends StatelessWidget {
  const MovieDetailsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            GeneralInformationsAndPoster(),
            OverlayImage(),
            Positioned(
              top: 55,
              child: CustomBackButton(),
            ),
          ],
        ),
        SizedBoxExtension.height(40),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: CupertinoColors.secondarySystemBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 8, 64, 88).withAlpha(25),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, -2)),
              ],
            ),
            child: Column(
              children: [
                SizedBoxExtension.height(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SegmentedButton(
                    segments: const [
                      ButtonSegment(
                        value: 0,
                        label: Text('About'),
                      ),
                      ButtonSegment<int>(
                        value: 1,
                        label: Text('Info'),
                      ),
                      ButtonSegment<int>(
                        value: 2,
                        label: Text('Ratings'),
                      ),
                    ],
                    onSelectionChanged: (Set<int> newSelection) {
                      context.read<DetailsSelectionCubit>().setDetailsSelection(
                            newSelection.first,
                          );
                    },
                    showSelectedIcon: false,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return Colors.white;
                          }
                          return const Color.fromARGB(255, 235, 235, 251);
                        },
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    selected: context.select(
                        (DetailsSelectionCubit cubit) => cubit.state == 0
                            ? {0}
                            : cubit.state == 1
                                ? {1}
                                : {2}),
                  ),
                ),
                SizedBoxExtension.height(20),
                Expanded(
                  child: BlocBuilder<DetailsSelectionCubit, int>(
                    builder: (context, state) {
                      if (state == 0) {
                        return AboutMovieSection();
                      }
                      if (state == 1) {
                        return Center(
                          child: Text('Ratings'),
                        );
                      }
                      if (state == 2) {
                        return Center(
                          child: Text('Comments'),
                        );
                      }
                      return Text('Unknown state');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AboutMovieSection extends StatelessWidget {
  const AboutMovieSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text("About the Movie",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 53, 65, 93))),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, right: 20),
              child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
                  builder: (context, movieDetailsState) {
                if (movieDetailsState is MovieDetailsLoading) {
                  return LoadingIndicator();
                }
                if (movieDetailsState is MovieDetailsError) {
                  return ErrorMessage(message: movieDetailsState.message);
                }
                if (movieDetailsState is MovieDetailsLoaded) {
                  return MovieStatusBadge(
                      status: movieDetailsState.movie.status);
                }
                return Container();
              }),
            )
          ],
        ),
        SizedBoxExtension.height(10),
        BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
            builder: (context, movieDetailsState) {
          if (movieDetailsState is MovieDetailsLoading) {
            return LoadingIndicator();
          }
          if (movieDetailsState is MovieDetailsError) {
            return ErrorMessage(message: movieDetailsState.message);
          }
          if (movieDetailsState is MovieDetailsLoaded) {
            return MovieOverview(overview: movieDetailsState.movie.overview);
          }
          return Text("Unknown state");
        })
      ],
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}

class MovieStatusBadge extends StatelessWidget {
  final String status;

  const MovieStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: statusColor[status] ?? CupertinoColors.systemGrey2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
        child: Text(
          status,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MovieOverview extends StatelessWidget {
  final String overview;

  const MovieOverview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        overview,
        style: TextStyle(
          fontSize: 14,
          color: CupertinoColors.black,
        ),
      ),
    );
  }
}
