import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_albums/domain/entities/top_albums_entity.dart';
import 'package:top_albums/presentation/bloc/album_bloc.dart';
import 'package:top_albums/presentation/pages/widgets/album_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static int page = 1;
  int totalItems = 0;
  final ScrollController _sc = ScrollController();
  bool isLoading = true;
  List<AlbumEntity> albums = [];

  @override
  void initState() {
    final Map<String, dynamic> param = {
      "method": "artist.gettopalbums",
      "artist": "cher",
      "api_key": "a35699f435445486aec22d7a19e652bf",
      "format": "json",
      "page": page,
      "limit": 10
    };

    BlocProvider.of<AlbumBloc>(context).add(GetTopAlbums(param));
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        page = page + 1;
        if (totalItems > albums.length) {
          BlocProvider.of<AlbumBloc>(context).add(GetTopAlbums(param));
        }
      }
    });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlbumBloc, AlbumState>(
      listener: (context, state) {
        if (state is AlbumLoaded) {
          totalItems = int.parse(state.albums.total ?? "0");
          albums.addAll(state.albums.albums ?? []);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Top Albums"),
          ),
          body: SafeArea(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: albums.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BlocBuilder<AlbumBloc, AlbumState>(
                        builder: (context, state) {
                          if (state is AlbumError) {
                            return Center(
                              child: Text(state.errorMsg),
                            );
                          }
                          if (index == albums.length) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return AlbumItems(
                              albumEntity: albums[index],
                            );
                          }
                        },
                      );
                    },
                    controller: _sc,
                  ),
          ),
        );
      },
    );
  }
}
