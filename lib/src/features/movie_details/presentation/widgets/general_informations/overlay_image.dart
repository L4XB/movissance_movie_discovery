import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/config/config.dart';
import 'package:red_line/src/common/extensions/custom_theme_colors_extension.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_details_cubit/movie_details_cubit.dart';

class OverlayImage extends StatelessWidget {
  const OverlayImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// ----------------- Local Variables ----------------- ///
    final size = MediaQuery.of(context).size;
    final themeExtension =
        Theme.of(context).extension<CustomThemeColorsExtension>();

    /// ----------------- Widget ----------------- ///
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoading) {
          return Padding(
            padding: EdgeInsets.only(top: size.height * 0.4),
            child: Center(
              child: CircularProgressIndicator(
                color: themeExtension?.primaryColor,
              ),
            ),
          );
        }
        if (state is MovieDetailsError) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is MovieDetailsLoaded) {
          return Positioned(
            top: size.height * 0.188,
            left: size.width * 0.051,
            child: Container(
              height: size.height * 0.2055,
              width: size.width * 0.305,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: themeExtension?.contrastBorderColor as Color,
                  width: 2,
                ),
                image: DecorationImage(
                  image: state.movie.posterPath != ""
                      ? NetworkImage(theMovieDatabaseApiImageBaseURL +
                          state.movie.posterPath)
                      : AssetImage("assets/images/no_image_placeholder.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        }
        return Text("Unknown state");
      },
    );
  }
}
