import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/Weather_boc/weather_event.dart';
import 'package:weather/bloc/Weather_boc/weather_states.dart';
import 'package:weather/data/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final weatherRepository repo;
  WeatherBloc(this.repo) : super(WeatherInitState()) {
    on<FetchWeather>(
      (event, emit) async {
        emit(WeatherLoadingState());
        try {
          final temp = await repo.fetchTemp(event.city);
          emit(WeatherSuccessState(event.city, temp));
        } catch (e) {
          emit(WeatherErrorState('faillllllllllllllll'));
        }
      },
    );
  }
}
