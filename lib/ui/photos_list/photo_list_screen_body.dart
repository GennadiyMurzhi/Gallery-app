import 'package:flutter/material.dart';
import 'package:gallery_app/application/data_receiver.dart';
import 'package:gallery_app/domain/photo.dart';
import 'package:gallery_app/injectable.dart';
import 'package:gallery_app/ui/photos_list/photo_list_item_widget.dart';

///body of PhotoListScreen
class PhotoListScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double itemWidth = MediaQuery.of(context).size.width / 2;

    return StreamBuilder<PhotosList>(
      stream: getIt<DataReceiver<PhotosList>>().dataStream,
      builder: (BuildContext context, AsyncSnapshot<PhotosList> snapshot) {
        if (snapshot.data != null) {
          return ListView.builder(
            itemCount: snapshot.data!.total,
            itemBuilder: (BuildContext context, int index) => PhotoListItemWidget(
              width: itemWidth,
              photo: snapshot.data!.photoList[index],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
