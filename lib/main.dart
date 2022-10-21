import 'package:flutter/material.dart';
import 'package:gallery_app/injectable.dart';
import 'package:gallery_app/ui/app.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.prod);

  runApp(const GalleryApp());
}
