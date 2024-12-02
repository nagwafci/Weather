import 'package:flutter/material.dart';

Widget loadingWidgit() {
  return Builder(builder: (context) {
    return Center(
        child: Expanded(
      child: Center(child: CircularProgressIndicator()),
    ));
  });
}
