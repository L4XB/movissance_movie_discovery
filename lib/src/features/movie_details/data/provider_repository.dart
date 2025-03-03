import 'package:red_line/src/features/movie_details/domain/provider_model.dart';

abstract class ProviderRepository {
  /// fetches the provider details of the movie from the API
  /// [id] is the movie id
  /// [returns] a [ProviderModel]
  Future<ProviderModel> getProvider(int id);
}
