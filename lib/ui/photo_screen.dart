import 'package:flutter/material.dart';

///photo screen
class PhotoScreen extends StatelessWidget {
  ///pass link to display photo
  const PhotoScreen({
    super.key,
    required this.link,
  });

  ///photo link
  final String link;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(
        link,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
