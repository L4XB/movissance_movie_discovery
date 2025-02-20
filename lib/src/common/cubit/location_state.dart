part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationLoaded extends LocationState {
  final String location;

  LocationLoaded(this.location);
}

final class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}
