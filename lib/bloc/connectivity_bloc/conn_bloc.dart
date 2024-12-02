import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/connectivity_bloc/conn_event.dart';
import 'package:weather/bloc/connectivity_bloc/conn_state.dart';

class ConnectBloc extends Bloc<ConnectEvent, ConnectState> {
  ConnectBloc() : super(connectInital()) {
    on<CheckConnect>(
      (event, emit) async {
        final connectResult = await (Connectivity().checkConnectivity());
        if (connectResult == ConnectivityResult.mobile ||
            connectResult == ConnectivityResult.wifi) {
          emit(connectDone());
        } else {
          emit(connectNotConn());
        }
      },
    );
  }
}
