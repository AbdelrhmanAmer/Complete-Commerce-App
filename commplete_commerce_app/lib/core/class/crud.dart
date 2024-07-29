
import 'dart:convert';

import 'package:commplete_commerce_app/app_links.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import '../functions/check_internet.dart';
import 'status_request.dart';

class Crud {
  Future<Either<StatusRequest, Map<String, dynamic>>> postData(String url, Map<String, dynamic> data) async {
    try {
      if (await checkInternet()) {
        final dio = Dio();
        final cookieJar = CookieJar();
        dio.interceptors.add(CookieManager(cookieJar));
        dio.options.headers['accept'] = 'application/json';
        dio.options.headers['Content-Type'] = 'application/json';
        dio.options.headers['Authorization'] = 'Basic${base64Encode(utf8.encode('if0_36908677:uj351fAzCV2'))}';
        
        var response = await dio.get(AppLinks.test);
          
        print('Response Body (before decode) $response');
        if(response.statusCode == 200 || response == 201){
          Map<String, dynamic> responseBody = jsonDecode(response.data);
          print('\n response Body: $responseBody');
          return Right(responseBody);
        }else{
          print('Server Erorr: ${response.statusCode}');
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        print('No internet connection');
        return const Left(StatusRequest.internetFailure);
      }
    } catch (e) {
      print('Exception: $e');
      return const Left(StatusRequest.serverFailure);
    }
  }
}
