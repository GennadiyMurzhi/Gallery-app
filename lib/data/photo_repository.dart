import 'package:dio/dio.dart';
import 'package:gallery_app/domain/i_photo_repository.dart';
import 'package:gallery_app/domain/photo.dart';
import 'package:injectable/injectable.dart';

///auth key
const String accessKey = 'cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';

///my auth key
const String myAccessKey = 'FEcQGDNpz3naPKTZV3ZGWXgCa0H7agQoN-DteHiFzFM';

///class implementing the photo repository
@LazySingleton(as: IPhotoRepository)
class PhotoRepository implements IPhotoRepository {
  ///pass dio for network manipulation
  PhotoRepository(this._dio);

  final Dio _dio;

  @override
  Future<PhotosList> getPhotos() async {
    final Response response = await _dio.get(
      'https://api.unsplash.com/photos/',
      options: Options(
        headers: <String, dynamic>{
          'Authorization': 'Client-ID $myAccessKey',
        },
      ),
    );
    if (response.statusCode != null && response.statusCode == 200) {
      return PhotosList.fromJsonList(response.data as List<dynamic>);
    } else {
      throw Exception('Error on get photos. Status Code: ${response.statusCode}');
    }
  }
}
