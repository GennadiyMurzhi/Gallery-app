// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/gallery_cubit/gallery_cubit.dart' as _i6;
import 'data/photo_repository.dart' as _i4;
import 'domain/i_photo_repository.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.IPhotoRepository>(
      () => _i4.PhotoRepository(get<_i5.Dio>()));
  gh.lazySingleton<_i6.GalleryCubit>(
      () => _i6.GalleryCubit(get<_i3.IPhotoRepository>()));
  return get;
}
