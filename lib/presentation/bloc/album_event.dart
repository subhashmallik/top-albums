part of 'album_bloc.dart';

abstract class AlbumEvent extends Equatable {
  const AlbumEvent();
  @override
  List<Object> get props => [];
}

class GetTopAlbums extends AlbumEvent {
  final Map<String, dynamic> param;

  const GetTopAlbums(this.param);

  @override
  List<Object> get props => [param];
}

