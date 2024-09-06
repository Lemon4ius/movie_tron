import 'package:dio/dio.dart';
import 'package:movie_tron/generated/intl/messages_en.dart';

class ExceptionHandler implements Exception{
  String _errorMessage = '';

  ExceptionHandler(this._errorMessage);

  ExceptionHandler.dioException({required DioException error}) {
    _handleDioException(error);
  }

  ExceptionHandler.otherException() {
    _handleOtherException();
  }

  //error getter
  getErrorMessage() {
    return _errorMessage;
  }

  ExceptionHandler _handleDioException(DioException error) {
      switch(error.type){
        case DioExceptionType.connectionError:
          _errorMessage = 'Network error';
          return ExceptionHandler(_errorMessage);
        case DioExceptionType.connectionTimeout:
          _errorMessage = 'connectionTimeout';
          return ExceptionHandler(_errorMessage);
        case DioExceptionType.sendTimeout:
          _errorMessage = 'sendTimeout';
          return ExceptionHandler(_errorMessage);
        case DioExceptionType.receiveTimeout:
          _errorMessage = 'receiveTimeout';
          return ExceptionHandler(_errorMessage);
        case DioExceptionType.badCertificate:
          _errorMessage = 'badCertificate';
          return ExceptionHandler(_errorMessage);
        case DioExceptionType.badResponse:
          _errorMessage = 'badResponse';
          return ExceptionHandler(_errorMessage);
        case DioExceptionType.cancel:
          _errorMessage = 'cancel';
          return ExceptionHandler(_errorMessage);
        case DioExceptionType.unknown:
          _errorMessage = 'unknown';
          return ExceptionHandler(_errorMessage);
      }
  }

  ExceptionHandler _handleOtherException() {
    _errorMessage = 'Something went Wrong';
    ExceptionHandler exceptionHandler = ExceptionHandler(_errorMessage);
    return exceptionHandler;
  }

}