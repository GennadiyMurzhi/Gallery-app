import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery_app/application/data_receiver.dart';
import 'package:gallery_app/domain/i_photo_repository.dart';
import 'package:gallery_app/domain/photo.dart';
import 'package:gallery_app/injectable.dart';
import 'package:injectable/injectable.dart';

part 'gallery_cubit.freezed.dart';

part 'gallery_state.dart';

///cubit for photo management
@lazySingleton
class GalleryCubit extends Cubit<GalleryState> {
  ///pass repository to be able to retrieve photos from the server
  GalleryCubit(this._photoRepository) : super(GalleryState.initial());

  final IPhotoRepository _photoRepository;

  ///method to get photos from the server and putting photos in the stream
  Future<void> initialGallery() async {
    final PhotosList photosList = await _photoRepository.getPhotos();
    getIt<DataReceiver<PhotosList>>().addData(photosList);

    emit(
      state.copyWith(
        loading: false,
      ),
    );
  }
}
