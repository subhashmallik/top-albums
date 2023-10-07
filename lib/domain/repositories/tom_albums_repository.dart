import 'package:top_albums/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:top_albums/domain/entities/top_albums_entity.dart';

abstract class TopAlbumsRepository{
  Future<Either<Failure, TopAlbumEntity>> getTopAlbums(Map<String, dynamic> queryParam);
}