import 'package:equatable/equatable.dart';

class TopAlbumEntity extends Equatable {
  final String? totalPages;
  final String? total;
  final List <AlbumEntity>? albums;

  const TopAlbumEntity({this.totalPages, this.total, this.albums});

  @override
  List<Object?> get props => [totalPages, total, albums];
}


class AlbumEntity extends Equatable {
  final String? title;
  final String? imgUrl;

  const AlbumEntity(this.title, this.imgUrl);

  @override
  List<Object?> get props => [title, imgUrl];
}

