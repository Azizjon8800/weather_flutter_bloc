import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_bloc/bloc/weather_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc()..add(const GetCityNameEvent('Tashkent')),
      child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state.status == WeatherStatus.loading) {
            return const Scaffold(body: Center(child: Text('loading'),),);
          }
          if(state.status == WeatherStatus.loaded) {
            return Scaffold(body: Center(child: Text(state.data.name ?? 'init'),),);
          }
          if(state.status == WeatherStatus.error) {
            return Scaffold(body: Center(child: Text(state.error),),);
          }
          return const Scaffold();
        },
      ),
    );
  }
}
