import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:top_albums/core/error/failures.dart';
import 'package:top_albums/domain/entities/top_albums_entity.dart';
import 'package:top_albums/domain/usecase/get_top_albums_usecase.dart';

part 'album_event.dart';

part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final TopAlbumUseCase _albumUseCase;

  AlbumBloc(this._albumUseCase) : super(AlbumInitial()) {
    on<GetTopAlbums>(
      (event, emit) async {
        emit(AlbumLoading());
        final failureOrSuccess = await _albumUseCase(event.param);
        failureOrSuccess.fold(
          (l) => emit(
            AlbumError(
              mapFailureToMessage(l),
            ),
          ),
          (r) => emit(
            AlbumLoaded(r),
          ),
        );
      },
    );
  }
}
