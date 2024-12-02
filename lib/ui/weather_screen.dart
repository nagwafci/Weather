import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/Weather_boc/weather_bloc.dart';
import 'package:weather/bloc/Weather_boc/weather_states.dart';
import 'package:weather/bloc/connectivity_bloc/conn_bloc.dart';
import 'package:weather/bloc/connectivity_bloc/conn_state.dart';
import 'package:weather/ui/widgets/weather/errror.dart';
import 'package:weather/ui/widgets/weather/init.dart';
import 'package:weather/ui/widgets/weather/loading.dart';
import 'package:weather/ui/widgets/weather/success.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});
  // late TextEditingController searchTextController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectBloc, ConnectState>(
      listener: (context, state) {
        if (state is connectDone) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('connected')));
        } else if (state is connectNotConn) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Not connected')));
        }
      },
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitState) {
            return initWidgit();
          } else if (state is WeatherLoadingState) {
            return loadingWidgit();
          } else if (state is WeatherSuccessState) {
            return successWidgit(state.city, state.temp);
          } else if (state is WeatherErrorState) {
            return errorWidgit(state.message);
          } else {
            return loadingWidgit();
          }
        },
      ),
    );
  }
}
