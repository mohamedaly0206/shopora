import 'package:flutter/material.dart';
import 'package:shopora/config/di/di.dart';
import 'package:shopora/shopora.dart';

void main() {
  configureDependencies();
  runApp(const Shopora());
}
