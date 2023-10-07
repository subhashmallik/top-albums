// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopAlbumModel _$TopAlbumModelFromJson(Map<String, dynamic> json) =>
    TopAlbumModel(
      topalbums: json['topalbums'] == null
          ? null
          : TopAlbums.fromJson(json['topalbums'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopAlbumModelToJson(TopAlbumModel instance) =>
    <String, dynamic>{
      'topalbums': instance.topalbums,
    };

TopAlbums _$TopAlbumsFromJson(Map<String, dynamic> json) => TopAlbums(
      album: (json['album'] as List<dynamic>?)
          ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
          .toList(),
      attr: json['@attr'] == null
          ? null
          : Attr.fromJson(json['@attr'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopAlbumsToJson(TopAlbums instance) => <String, dynamic>{
      'album': instance.album,
      '@attr': instance.attr,
    };

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      name: json['name'] as String?,
      playcount: json['playcount'] as int?,
      mbid: json['mbid'] as String?,
      url: json['url'] as String?,
      artist: json['artist'] == null
          ? null
          : Artist.fromJson(json['artist'] as Map<String, dynamic>),
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'name': instance.name,
      'playcount': instance.playcount,
      'mbid': instance.mbid,
      'url': instance.url,
      'artist': instance.artist,
      'image': instance.image,
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist(
      name: json['name'] as String?,
      mbid: json['mbid'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'name': instance.name,
      'mbid': instance.mbid,
      'url': instance.url,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      text: json['#text'] as String?,
      size: json['size'] as String?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      '#text': instance.text,
      'size': instance.size,
    };

Attr _$AttrFromJson(Map<String, dynamic> json) => Attr(
      artist: json['artist'] as String?,
      page: json['page'] as String?,
      perPage: json['perPage'] as String?,
      totalPages: json['totalPages'] as String?,
      total: json['total'] as String?,
    );

Map<String, dynamic> _$AttrToJson(Attr instance) => <String, dynamic>{
      'artist': instance.artist,
      'page': instance.page,
      'perPage': instance.perPage,
      'totalPages': instance.totalPages,
      'total': instance.total,
    };
