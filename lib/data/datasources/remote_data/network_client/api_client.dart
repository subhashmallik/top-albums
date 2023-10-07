
import 'package:chopper/chopper.dart';
import 'package:top_albums/data/datasources/remote_data/network_client/api_service.dart';

class ApiClient {
  ApiService getAlbumApi() {
    final jouleClient = ChopperClient(
      baseUrl: Uri.parse("http://ws.audioscrobbler.com/2.0"),
      services: [
        ApiService.create(),
      ],
      // Converts data to & from JSON and adds the application/json header.
      converter: const JsonConverter(),
    );
    return jouleClient.getService();
  }
}
