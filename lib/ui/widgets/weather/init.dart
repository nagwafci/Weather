import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/Weather_boc/weather_bloc.dart';
import 'package:weather/bloc/Weather_boc/weather_event.dart';

class initWidgit extends StatefulWidget {
  const initWidgit({super.key});

  @override
  State<initWidgit> createState() => _initWidgitState();
}

class _initWidgitState extends State<initWidgit> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(builder: (context) {
            return SafeArea(
              child: Center(
                child: Column(children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width / 3,
                    child: TextField(
                      controller: myController,
                      decoration: const InputDecoration(
                        labelText: "Enter your City",
                        border: InputBorder.none,
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => context
                          .read<WeatherBloc>()
                          .add(FetchWeather(myController.text)),
                      child: const Text("Fetch Weather"))
                ]),
              ),
            );
          }),
        ],
      ),
    );
    ;
  }
}
