part of 'connectivity_cubit.dart';

@immutable
sealed class ConnectivityState {}

/// initial state of the connectivity cubit
final class ConnectivityInitial extends ConnectivityState {}

/// state of the connectivity cubit when the device is connected to the internet
final class ConnectivityConnected extends ConnectivityState {}

/// state of the connectivity cubit when the device is disconnected from the internet
final class ConnectivityDisconnected extends ConnectivityState {}
