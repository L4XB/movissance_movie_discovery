import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:red_line/src/config.dart';
import 'package:red_line/src/features/movie_details/bloc/movie_provider_cubit/movie_provider_cubit.dart';
import 'package:red_line/src/features/movie_details/domain/provider_model.dart';

class MovieProviderSection extends StatelessWidget {
  const MovieProviderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieProviderCubit, MovieProviderState>(
      builder: (context, state) {
        if (state is MovieProviderLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        if (state is MovieProviderError) {
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Lottie.asset("assets/animations/no_data_animation.json",
                    width: 400),
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
                _buildSectionHeader("Flatrate"),
                ...state.provider.flatrate
                    .map((provider) => _buildProviderTile(provider)),
              ],
              if (state.provider.rent.isNotEmpty) ...[
                _buildSectionHeader("Rent"),
                ...state.provider.rent
                    .map((provider) => _buildProviderTile(provider)),
              ],
              if (state.provider.buy.isNotEmpty) ...[
                _buildSectionHeader("Buy"),
                ...state.provider.buy
                    .map((provider) => _buildProviderTile(provider)),
              ],
            ],
          );
        }
        return Text("Unknown state");
      },
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 20, bottom: 15),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 53, 65, 93),
        ),
      ),
    );
  }

  Widget _buildProviderTile(Provider provider) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 5, bottom: 10),
      child: ListTile(
        leading: Image.network(
          theMovieDatabaseApiImageBaseURL + provider.logoPath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(provider.providerName),
      ),
    );
  }
}
