import 'package:dio/dio.dart';

class VpnInterceptor extends Interceptor {
  final Dio dio;

  VpnInterceptor(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    switch(err.type){
      case DioExceptionType.connectionError:
        await Future.delayed(const Duration(seconds: 5));
        final a = await dio.fetch(err.requestOptions);
        handler.resolve(a);
        break;
      default:
        throw Exception('Не обработанная ошибка - ${err.message}');
    }
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
