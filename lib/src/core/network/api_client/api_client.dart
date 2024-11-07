import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../base_dio/base_dio.dart';
import '../model/token_model/user_token_model.dart';
import '../model/user_data_model/user_data_model.dart';

part 'api_client.g.dart';

const accessToken = "security/oauth2/token";

@RestApi()
abstract class ApiClient {
  factory ApiClient() {
    final BaseDio baseDio = BaseDio();
    return _ApiClient(baseDio.dio);
  }

  @POST(accessToken)
  Future<UserTokenModel> getAccessToken(@Body() UserDataModel userDataModel);
}
