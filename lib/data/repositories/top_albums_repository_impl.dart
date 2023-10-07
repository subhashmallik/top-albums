import 'package:dartz/dartz.dart';
import 'package:top_albums/core/error/exceptions.dart';
import 'package:top_albums/core/error/failures.dart';
import 'package:top_albums/core/mapper/album_model_to_entity.dart';
import 'package:top_albums/core/network/network_info.dart';
import 'package:top_albums/data/datasources/remote_data/top_albums_remote.dart';
import 'package:top_albums/data/models/top_album_model.dart';
import 'package:top_albums/domain/entities/top_albums_entity.dart';
import 'package:top_albums/domain/repositories/tom_albums_repository.dart';

class TopAlbumsRepositoryImpl extends TopAlbumsRepository{
  final NetworkInfo networkInfo;
  final TopAlbumsRemote topAlbumsRemote;
  final AlbumModelToEntityMapper mapper;

  TopAlbumsRepositoryImpl(this.networkInfo, this.topAlbumsRemote, this.mapper);
  @override
  Future<Either<Failure, TopAlbumEntity>> getTopAlbums(Map<String, dynamic> queryParam) async {
    try {
      if (await networkInfo.isConnected) {
       final TopAlbumModel topAlbumModel = await topAlbumsRemote.getTopAlbumsRemote(queryParam);
        final albums =  mapper.call(topAlbumModel);
        return Right(albums);
      } else {
        return Left(NetworkFailure("No internet"));
      }
    } on ServerException {
      return Left(ServerFailure("Something went wrong! Please try after sometime"));
    }
    catch (e) {
      return Left(UnhandledFailure("Something went wrong"));
    }
  }

}