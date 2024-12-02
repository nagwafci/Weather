abstract class WeatherState {}

class WeatherInitState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final String city;
  final double temp;
  WeatherSuccessState(this.city, this.temp);
}

class WeatherErrorState extends WeatherState {
  final String message;
  WeatherErrorState(this.message);
}
