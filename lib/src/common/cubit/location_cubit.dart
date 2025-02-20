import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_line/src/common/services/location_service.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  final LocationService _locationRepository = LocationService();

  void getCountryCode() async {
    emit(LocationLoading());
    print('Getting country code');
    try {
      final countryCode = await _locationRepository.getCountryCode();
      print('Country code: $countryCode');
      emit(LocationLoaded(countryCode));
    } catch (e) {
      print(e);
      emit(LocationError('Failed to get location'));
    }
  }
}
