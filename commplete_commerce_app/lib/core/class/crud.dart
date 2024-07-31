
import 'dart:convert';

import 'package:commplete_commerce_app/app_links.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../functions/check_internet.dart';
import 'status_request.dart';

class Crud {
  Future<Either<StatusRequest, Map<String, dynamic>>> postData(String url, Map<String, dynamic> data) async {
    try {
      if (await checkInternet()) {
        final dio = Dio();
        
        var response = await dio.get(AppLinks.test);
          
        if(response.statusCode == 200 || response.statusCode == 201){
          Map<String, dynamic> responseBody = jsonDecode(response.data);
          return Right(responseBody);
        }else{
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.internetFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverFailure);
    }
  }
}
