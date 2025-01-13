part of 'weather_bloc.dart';

enum WeatherStatus {
  initial,
  loading,
  loaded,
  error,
}

class WeatherState extends Equatable {
  final WeatherStatus status;
  final WeatherData data;
  final String error;

  const WeatherState({
    required this.status,
    required this.data,
    required this.error,
  });

  @override
  List<Object> get props => [status, data, error];

  factory WeatherState.initial() {
    return WeatherState(
      data: WeatherData(),
      status: WeatherStatus.initial,
      error: '',
    );
  }

  @override
  String toString() =>
      'WeatherState(status: $status, data: $data, error: $error)';

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherData? data,
    String? error,
  }) {
    return WeatherState(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}
