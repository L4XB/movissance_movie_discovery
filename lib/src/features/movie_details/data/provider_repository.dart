import 'package:red_line/src/features/home/domain/provider_model.dart';

abstract class ProviderRepository {
  Future<ProviderModel> getProvider(int id);
}
