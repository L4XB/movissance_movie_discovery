import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_provider_cubit/movie_provider_cubit.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details/movie_details_sections/widgets/provider_tile.dart';
import 'package:red_line/src/features/movie_details/presentation/widgets/movie_details/movie_details_sections/widgets/section_header.dart';

class MovieProviderSection extends StatelessWidget {
  const MovieProviderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<MovieProviderCubit, MovieProviderState>(
      builder: (context, state) {
        if (state is MovieProviderLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        if (state is MovieProviderError) {
          return Padding(
            padding: EdgeInsets.only(top: size.height * 0.035),
            child: Column(
              children: [
                Lottie.asset("assets/animations/no_data_animation.json",
                    repeat: false, width: size.width),
              ],
            ),
          );
        }
        if (state is MovieProviderLoaded) {
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              if (state.provider.flatrate.isNotEmpty) ...[
                SectionHeader(title: "Flatrate"),
                ...state.provider.flatrate
                    .map((provider) => ProviderTile(provider: provider)),
                SizedBoxExtension.height(size.height * 0.025),
              ],
              if (state.provider.rent.isNotEmpty) ...[
                SectionHeader(title: "Rent"),
                ...state.provider.rent
                    .map((provider) => ProviderTile(provider: provider)),
                SizedBoxExtension.height(size.height * 0.025),
              ],
              if (state.provider.buy.isNotEmpty) ...[
                SectionHeader(title: "Buy"),
                ...state.provider.buy
                    .map((provider) => ProviderTile(provider: provider)),
              ],
              SizedBoxExtension.height(size.height * 0.06),
            ],
          );
        }
        return Text("Unknown state");
      },
    );
  }
}
