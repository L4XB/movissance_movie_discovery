import 'package:dio/dio.dart';
import 'package:red_line/src/common/config/config.dart';
import 'package:red_line/src/features/movie_details/data/provider_repository.dart';
import 'package:red_line/src/features/movie_details/domain/provider_model.dart';

class ApiProviderRepository extends ProviderRepository {
  @override
  Future<ProviderModel> getProvider(int id) async {
    final Response response;

    response = await Dio().get(
        "$theMovieDatabaseApiBaseURL/movie/$id/watch/providers",
        queryParameters: {
          "api_key": theMovieDatabaseApiKey,
        });

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.data["results"]["GB"] == null) {
        throw Exception("No provider found");
      }
      return ProviderModel.fromJson(response.data["results"]["GB"]);
    } else {
      throw Exception("Failed to load provider");
    }
  }
}
