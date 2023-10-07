

import 'package:top_albums/core/mapper/mapper.dart';
import 'package:top_albums/data/models/top_album_model.dart';
import 'package:top_albums/domain/entities/top_albums_entity.dart';

class AlbumModelToEntityMapper
    extends Mapper<TopAlbumModel, TopAlbumEntity> {
  @override
  TopAlbumEntity call(TopAlbumModel input) {
    final List<AlbumEntity> items = [];

    for (final element in input.topalbums?.album ?? []) {
      items.add(AlbumEntity(element.name, element.image?[3].text));
    }

    return TopAlbumEntity(total: input.topalbums?.attr?.total, totalPages: input.topalbums?.attr?.totalPages, albums: items);
  }
}
