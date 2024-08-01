import 'package:shared_preferences/shared_preferences.dart';

class BaseDataStore{
  static const String _ACCESS_TOKEN_KEY = 'access_token';

  static final BaseDataStore _instance = BaseDataStore._init();
  late SharedPreferences _sharedPreferences;

  factory BaseDataStore(){
    return _instance;
  }

  BaseDataStore._init();

  initSharedPreferences() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  saveAccessToken(String accessToken) {
     _sharedPreferences.setString(_ACCESS_TOKEN_KEY, accessToken);
  }

  String getAccessToken(){
    return _sharedPreferences.getString(_ACCESS_TOKEN_KEY)?? '';
  }

  clear(){
    _sharedPreferences.clear();
  }
}