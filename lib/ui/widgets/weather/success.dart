import 'package:flutter/material.dart';

Widget successWidgit(String city, double temp) {
  return Builder(builder: (context) {
    return Center(
        child: Expanded(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(city),
          Text(temp.toString()),
        ],
      )),
    ));
  });
}
