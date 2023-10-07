import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:top_albums/core/error/exceptions.dart';
import 'package:top_albums/data/datasources/remote_data/network_client/api_client.dart';
import 'package:top_albums/data/models/top_album_model.dart';

abstract class TopAlbumsRemote {
  Future<TopAlbumModel> getTopAlbumsRemote(Map<String, dynamic> queryParam);
}

class TopAlbumsRemoteImpl extends TopAlbumsRemote {
  final ApiClient apiClient;

  TopAlbumsRemoteImpl(this.apiClient);

  @override
  Future<TopAlbumModel> getTopAlbumsRemote(Map<String, dynamic> queryParam) async {
    try {
      Response response = await apiClient.getAlbumApi().getTopAlbums(queryParam);
      TopAlbumModel topAlbumModel = TopAlbumModel.fromJson(response.body);
      return topAlbumModel;
    } catch (e) {
       throw ServerException("Something went wrong! Please try after sometime");
    }
  }
}
