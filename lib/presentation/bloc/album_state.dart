part of 'album_bloc.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();
}

class AlbumInitial extends AlbumState {
  @override
  List<Object> get props => [];
}

class AlbumLoading extends AlbumState {
  @override
  List<Object> get props => [];
}

class AlbumLoaded extends AlbumState {
  final TopAlbumEntity  albums;

  const AlbumLoaded(this.albums);
  @override
  List<Object> get props => [albums];
}

class AlbumError extends AlbumState {
  final String errorMsg;

  const AlbumError(this.errorMsg);
  @override
  List<Object> get props => [errorMsg];
}