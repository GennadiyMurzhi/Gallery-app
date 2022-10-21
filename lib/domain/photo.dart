import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

part 'photo.g.dart';

///model for photos list
@freezed
class PhotosList with _$PhotosList {
  ///pass param to create photos model
  factory PhotosList({
    required int total,
    required List<Photo> photoList,
  }) = _PhotosList;

  ///standard method to serialization for Photo model
  factory PhotosList.fromJsonList(List<dynamic> list) => PhotosList(
        total: list.length,
        photoList: List<Photo>.generate(
          list.length,
          (int index) => Photo.fromJson(list[index] as Map<String, dynamic>),
        ),
      );

  ///Photos model with empty photo list
  factory PhotosList.empty() => PhotosList(total: 0, photoList: List<Photo>.empty());
}

///Photo model
@freezed
class Photo with _$Photo {
  ///pass param to create photo model
  factory Photo({
    required String id,
    @JsonKey(defaultValue: 'no description') required String description,
    @UserConverter() required String user,
    required Urls urls,
  }) = _Photo;

  const Photo._();

  ///standard method to serialization for Photo model
  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  ///Photo model with empty photo's information
  factory Photo.empty() => Photo(
        id: '',
        description: '',
        user: '',
        urls: Urls.empty(),
      );

  ///method to search link
  String detectLink() {
    if (urls.regular != null) {
      return urls.regular!;
    } else if (urls.small != null) {
      return urls.small!;
    } else if (urls.full != null) {
      return urls.full!;
    } else if (urls.thumb != null) {
      return urls.thumb!;
    } else if (urls.raw != null) {
      return urls.raw!;
    } else {
      throw Exception('no photo link');
    }
  }
}

///converter to get the author name from json
class UserConverter implements JsonConverter<String, Map<String, dynamic>> {
  ///standard constructor. Needed to use annotation @UserConverter()
  const UserConverter();

  @override
  String fromJson(Map<String, dynamic> user) {
    return user['name'] as String;
  }

  @override
  Map<String, dynamic> toJson(String user) {
    return <String, dynamic>{'name': user};
  }
}

///Links model for easy use links
@freezed
class Urls with _$Urls {
  ///pass param to create photo model
  factory Urls({
    required String? regular,
    required String? small,
    required String? thumb,
    required String? full,
    required String? raw,
  }) = _Urls;

  ///standard method to serialization for Photo model
  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  ///Photo model with empty photo's information
  factory Urls.empty() => Urls(
        regular: '',
        small: '',
        thumb: '',
        full: '',
        raw: '',
      );
}
