part of 'gallery_cubit.dart';

///state for photos cubit
@freezed
abstract class GalleryState with _$GalleryState {
  ///pass params to store them in state
  const factory GalleryState({
    required bool loading,
  }) = _GalleryState;

  ///constructor to generate params
  factory GalleryState.initial() => const GalleryState(loading: true);
}
