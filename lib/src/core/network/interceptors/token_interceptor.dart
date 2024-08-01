import 'package:dio/dio.dart';


import '../../data_store/base_data_store.dart';
import '../api_client/api_client.dart';
import '../model/user_data_model/user_data_model.dart';

class TokenInterceptor extends Interceptor {
  static const _AUTH_HEADER = 'Authorization';
  final BaseDataStore baseDataStore = BaseDataStore();
  final Dio dio;

  TokenInterceptor(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response!.statusCode == 401) {
      dio.options.headers.remove(_AUTH_HEADER);
      baseDataStore.clear();
      final responseToken = await ApiClient().getAccessToken(UserDataModel());
      final token = '${responseToken.token_type} ${responseToken.access_token}';
      baseDataStore.saveAccessToken(token);
      print(token);
      dio.options.headers['Authorization'] = token;
      try {
        final response = await dio.fetch(err.requestOptions);
        handler.resolve(response);
      } on DioException catch (e) {}
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = baseDataStore.getAccessToken();
    if (accessToken.isNotEmpty) {
      options.headers.addAll({_AUTH_HEADER: accessToken});
    }
    return handler.next(options);
  }
}
