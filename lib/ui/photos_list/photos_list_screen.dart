import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/application/gallery_cubit/gallery_cubit.dart';
import 'package:gallery_app/injectable.dart';
import 'package:gallery_app/ui/photos_list/photo_list_screen_body.dart';

///Photos list screen
class PhotosListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<GalleryCubit>(
        create: (BuildContext context) => getIt<GalleryCubit>()..initialGallery(),
        child: BlocBuilder<GalleryCubit, GalleryState>(
          builder: (BuildContext context, GalleryState state) => state.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : PhotoListScreenBody(),
        ),
      ),
    );
  }
}
