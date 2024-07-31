import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../functions/check_internet.dart';
import 'status_request.dart';

class Crud {
  Future<Either<StatusRequest, Map<String, dynamic>>> postData(
      String url, Map<String, dynamic> data) async {
    try {
      if (await checkInternet()) {
        final dio = Dio();
        final response = await dio.post(url, data: FormData.fromMap(data));
        print('-------------------------------------');
        print('Crud.dart: dio Response ${response.data}  ');
        print('Crud.dart: response.statusCode ${response.statusCode} ');

        Map<String, dynamic> responseBody;

        if (response.data is String) {
          responseBody = jsonDecode(response.data);
        } else if (response.data is Map) {
          responseBody = response.data as Map<String, dynamic>;
        } else {
          return const Left(StatusRequest.serverException);
        }

        print('Crud.dart: response.body $responseBody ');

        if (responseBody['status'] == 'exists') {
          return const Left(StatusRequest.emailOrPhoneExists);
        } else if (responseBody['status'] == 'success') {
          if (responseBody['data']['insertStatus'] == 'success' &&
              responseBody['data']['emailStatus'] == 'failure') {
            return const Left(StatusRequest.successInsertFailedSending);
          }
        } else if (responseBody['status'] == 'failure') {
          return const Left(StatusRequest.insertFailure);
        } else if (responseBody['status'] == 'Error') {
          return const Left(StatusRequest.serverException);
        }

        return Right(responseBody);
      } else {
        return const Left(StatusRequest.internetFailure);
      }
    } catch (e) {
      print('Crud.dart: Error: $e');
      return const Left(StatusRequest.serverException);
    }
  }
}
