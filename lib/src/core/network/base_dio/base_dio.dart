import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data_store/base_data_store.dart';
import '../interceptors/token_interceptor.dart';

class BaseDio {
  static const CONTENT_TYPE = 'application/x-www-form-urlencoded';
  static const _CONTENT_TYPE_HEADET = 'Content-Type';
  static const _AUTH_HEADET = 'Authorization';
  static const BASE_URL = 'https://api.themoviedb.org/3/';

  final BaseDataStore _baseDataStore = BaseDataStore();
  late Dio dio;
  static final BaseDio _instance = BaseDio._internal();

  factory BaseDio() {
    return _instance;
  }

  BaseDio._internal() {
    final prettyLogger = PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    );
    const accessToken = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MTFhYjZmMGEzNDY3M2ZkMzZiMzkxNTAwMTAxM2ZiMiIsIm5iZiI6MTcyMTU2ODcyOC43Njg1NDYsInN1YiI6IjY2OWQwNGIyMDczOTIzYWQ0OTE4NDUyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wmymXNPm5Q9HRnbu0wOdcZbayeWXKZUisWyi0_hsgmY';
    // _baseDataStore.getAccessToken();
    
    final dioOption = BaseOptions(
      baseUrl: BASE_URL,
      headers: {
        _AUTH_HEADET: accessToken,
        // _CONTENT_TYPE_HEADET: CONTENT_TYPE
      },
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    dio = Dio()
      ..options = dioOption
      ..interceptors.clear()
      ..interceptors.add(prettyLogger);
      // dio.interceptors.add(TokenInterceptor(dio))
    ;
  }
}
