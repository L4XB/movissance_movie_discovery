part of 'connectivity_cubit.dart';

@immutable
sealed class ConnectivityState {}

final class ConnectivityInitial extends ConnectivityState {}

final class ConnectivityConnected extends ConnectivityState {}

final class ConnectivityDisconnected extends ConnectivityState {}
