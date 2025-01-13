
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_flutter_bloc/models/weather_data.dart';
import 'package:weather_flutter_bloc/rapo/weather_rapo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState.initial()) {
    on<WeatherEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetCityNameEvent>((event, emit) async {
      state.copyWith(status: WeatherStatus.loading);
      try {
        WeatherData weatherData = await WeatherRapo.apiCall(event.cityName);

        emit(state.copyWith(status: WeatherStatus.loaded, data:weatherData));
      } catch (e) {
        emit(state.copyWith(status: WeatherStatus.error, error: e.toString()));
      }
    });
  }
}
