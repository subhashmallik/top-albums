
import 'package:chopper/chopper.dart';
part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class ApiService extends ChopperService {

  @Get()
  Future<Response> getTopAlbums( @QueryMap() Map<String, dynamic> queryParam,);

  static ApiService create([ChopperClient? client]) => _$ApiService(client);
}
