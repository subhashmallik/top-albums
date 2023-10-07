import 'package:json_annotation/json_annotation.dart';

part 'top_album_model.g.dart';

@JsonSerializable()
class TopAlbumModel {
  final TopAlbums? topalbums;

  const TopAlbumModel({
    this.topalbums,
  });

  factory TopAlbumModel.fromJson(Map<String, dynamic> json) =>
      _$TopAlbumModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopAlbumModelToJson(this);
}

@JsonSerializable()
class TopAlbums {
  final List<Album>? album;
  @JsonKey(name: '@attr')
  final Attr? attr;
  const TopAlbums({
    this.album,
    this.attr,
  });

  factory TopAlbums.fromJson(Map<String, dynamic> json) =>
      _$TopAlbumsFromJson(json);

  Map<String, dynamic> toJson() =>    _$TopAlbumsToJson(this);
}

@JsonSerializable()
class Album {
  final String? name;
  final int? playcount;
  final String? mbid;
  final String? url;
  final Artist? artist;
  final List<Image>? image;

  const Album({
    this.name,
    this.playcount,
    this.mbid,
    this.url,
    this.artist,
    this.image,
  });

  factory Album.fromJson(Map<String, dynamic> json) =>
      _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}

@JsonSerializable()
class Artist {
  final String? name;
  final String? mbid;
  final String? url;

  const Artist({
    this.name,
    this.mbid,
    this.url,
  });

  factory Artist.fromJson(Map<String, dynamic> json) =>
      _$ArtistFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}

@JsonSerializable()
class Image {
  @JsonKey(name: "#text")
  final String? text;
  final String? size;

  const Image({
    this.text,
    this.size,
  });

  factory Image.fromJson(Map<String, dynamic> json) =>
      _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable()
class Attr {
  final String? artist;
  final String? page;
  final String? perPage;
  final String? totalPages;
  final String? total;

  const Attr({
    this.artist,
    this.page,
    this.perPage,
    this.totalPages,
    this.total,
  });

  factory Attr.fromJson(Map<String, dynamic> json) =>
      _$AttrFromJson(json);

  Map<String, dynamic> toJson() => _$AttrToJson(this);
}
