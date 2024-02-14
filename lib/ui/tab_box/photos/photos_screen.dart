import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/blocs/photos/photos_bloc.dart';
import 'package:task_1/data/models/photos/photos_model.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  @override
  void initState() {
    context.read<PhotosBloc>().scrollController.addListener(() {
      if (context.read<PhotosBloc>().scrollController.position.pixels ==
          context.read<PhotosBloc>().scrollController.position.maxScrollExtent) {
        context.read<PhotosBloc>().add(FetchPhotos());
      }
    });
    context.read<PhotosBloc>().add(GetPhotos());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text("Comments screen"),
      ),
      body: BlocBuilder<PhotosBloc, PhotosState>(
        builder: (context, state) {
          if(state is ErrorPhotos){
            return Center(child: Text(state.errorText),);
          }
          if(state is SuccessPhotos) {
            return ListView(
              controller: context.read<PhotosBloc>().scrollController,
              children: [
                ...List.generate(state.photos.length, (index) {
                  PhotosModel photos = state.photos[index];
                  return CachedNetworkImage(imageUrl: photos.url,
                    placeholder: (context,url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context,url,error) => const Center(child: Icon(Icons.error)),);
                }),
                Visibility(
                    visible: context.watch<PhotosBloc>().isLoading,
                    child: const Center(child: CircularProgressIndicator(),))
              ],
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
