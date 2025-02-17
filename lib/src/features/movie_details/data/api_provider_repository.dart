import 'package:dio/dio.dart';
import 'package:red_line/src/config.dart';
import 'package:red_line/src/features/home/domain/provider_model.dart';
import 'package:red_line/src/features/movie_details/data/provider_repository.dart';

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
      return ProviderModel.fromJson(response.data);
    } else {
      throw Exception("Failed to load provider");
    }
  }
}
