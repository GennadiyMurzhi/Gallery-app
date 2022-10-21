import 'package:flutter/material.dart';
import 'package:gallery_app/ui/photos_list/photos_list_screen.dart';

///Gallery App. Start widget
class GalleryApp extends StatelessWidget {
  /// Initializes [key] for subclasses.
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery App',
      home: PhotosListScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFBEBEBE),
        primarySwatch: Colors.brown,
      ),
    );
  }
}
