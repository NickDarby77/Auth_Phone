import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_phone_auth_app_homework/core/app_consts.dart';
import 'package:flutter_phone_auth_app_homework/models/error_model.dart';
import 'package:flutter_phone_auth_app_homework/models/token_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final Dio dio;
  AuthRepository({required this.dio});

  final storage = const FlutterSecureStorage();

  String basicAuth = 'Basic ${base64.encode(
    utf8.encode('testEmil12:11223344'),
  )}';

  Future<TokenModel> getCode({required String phoneNumber}) async {
    final Response response = await dio.get(
      'https://app1.megacom.kg:9090/kp-auth/auth/generateUserId/test?',
      queryParameters: {
        "msisdn": phoneNumber,
      },
      options: Options(
        headers: {
          "authorization": basicAuth,
        },
      ),
    );
    final TokenModel result = TokenModel.fromJson(response.data);
    await storage.write(key: AppConsts.token, value: result.object);
    return result;
  }

  Future<ErrorModel> sendCode({required String code}) async {
    final tokenId = await storage.read(key: AppConsts.token);

    final Response response = await dio.get(
      'https://app1.megacom.kg:9090/kp-auth/auth/checkCode/test?',
      queryParameters: {
        "code": code,
        "uuId": tokenId,
      },
      options: Options(
        headers: {
          "authorization": basicAuth,
        },
      ),
    );
    final ErrorModel result = ErrorModel.fromJson(response.data);
    return result;
  }
}
