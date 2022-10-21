import 'package:flutter/material.dart';
import 'package:gallery_app/domain/photo.dart';
import 'package:gallery_app/ui/photo_screen.dart';

///list item
class PhotoListItemWidget extends StatelessWidget {
  ///pass photo model to display image with information
  const PhotoListItemWidget({
    super.key,
    required this.width,
    required this.photo,
  });

  ///image width
  final double width;

  ///photo model
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => PhotoScreen(link: photo.detectLink()),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Image.network(
              photo.detectLink(),
              width: width,
              height: width * 1.5,
            ),
            Text(
              'Author: ${photo.user}',
              textAlign: TextAlign.center,
            ),
            Text(
              'name (description): ${photo.description}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
