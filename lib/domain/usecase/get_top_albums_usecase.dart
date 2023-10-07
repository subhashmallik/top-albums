import 'package:dartz/dartz.dart';
import 'package:top_albums/core/error/failures.dart';
import 'package:top_albums/core/usecases/usecase.dart';
import 'package:top_albums/domain/entities/top_albums_entity.dart';
import 'package:top_albums/domain/repositories/tom_albums_repository.dart';

class TopAlbumUseCase extends UseCase<TopAlbumEntity, Map<String, dynamic>> {
  final TopAlbumsRepository topAlbumsRepository;
  TopAlbumUseCase(this.topAlbumsRepository);

  @override
  Future<Either<Failure, TopAlbumEntity>> call(Map<String, dynamic> param) async {
    return topAlbumsRepository.getTopAlbums(param);
  }
}