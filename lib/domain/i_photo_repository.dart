import 'package:gallery_app/domain/photo.dart';

///contract to create a photo repository
abstract class IPhotoRepository {
  ///method to get photos from the server
  Future<PhotosList> getPhotos();
}
