import 'package:red_line/src/features/movie_details/domain/provider_model.dart';

abstract class ProviderRepository {
  Future<ProviderModel> getProvider(int id);
}
