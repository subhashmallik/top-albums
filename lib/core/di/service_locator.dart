import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:top_albums/core/mapper/album_model_to_entity.dart';
import 'package:top_albums/core/network/network_info.dart';
import 'package:top_albums/data/datasources/remote_data/network_client/api_client.dart';
import 'package:top_albums/data/datasources/remote_data/top_albums_remote.dart';
import 'package:top_albums/data/repositories/top_albums_repository_impl.dart';
import 'package:top_albums/domain/repositories/tom_albums_repository.dart';
import 'package:top_albums/domain/usecase/get_top_albums_usecase.dart';
import 'package:top_albums/presentation/bloc/album_bloc.dart';

// sl - Service locator
final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<AlbumBloc>(
    () => AlbumBloc(
      sl<TopAlbumUseCase>(),
    ),
  );
  sl.registerLazySingleton(
    () => TopAlbumUseCase(
      sl<TopAlbumsRepository>(),
    ),
  );
  sl.registerLazySingleton<TopAlbumsRepository>(
    () => TopAlbumsRepositoryImpl(
      sl<NetworkInfo>(),
      sl<TopAlbumsRemote>(),
      sl<AlbumModelToEntityMapper>(),
    ),
  );
  sl.registerLazySingleton(
    () => AlbumModelToEntityMapper(),
  );

  sl.registerLazySingleton<TopAlbumsRemote>(
    () => TopAlbumsRemoteImpl(
      sl<ApiClient>(),
    ),
  );
  sl.registerLazySingleton(
    () => ApiClient(),
  );
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );
  sl.registerLazySingleton(
    () => Connectivity(),
  );
}
