import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/Weather_boc/weather_bloc.dart';
import 'package:weather/bloc/connectivity_bloc/conn_bloc.dart';
import 'package:weather/bloc/connectivity_bloc/conn_event.dart';

import 'package:weather/data/weather_repository.dart';

import 'package:weather/ui/weather_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => weatherRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<WeatherBloc>(
              create: (context) =>
                  WeatherBloc(context.read<weatherRepository>()),
            ),
            BlocProvider<ConnectBloc>(
              create: (context) => ConnectBloc()..add(CheckConnect()),
            ),
          ],
          child: WeatherPage(),
        ),
      ),
    );
  }
}
