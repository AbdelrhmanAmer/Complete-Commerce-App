import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../functions/check_internet.dart';

class Crud {
  Future<Map<String, dynamic>> postData(
      String url, Map<String, dynamic> data) async {
    try {
      if (await checkInternet()) {
        final dio = Dio();
        final response = await dio.post(url, data: FormData.fromMap(data));
        log('--------------------------------------------------------');
        log('Crud.dart: dio Response ${response.data.toString()}');
        log('Crud.dart: response.statusCode ${response.statusCode.toString()}');

        Map<String, dynamic>? responseBody;

        if (response.data is String) {
          responseBody = jsonDecode(response.data);
        } else if (response.data is Map) {
          responseBody = response.data as Map<String, dynamic>;
        }

        log('Crud.dart: response.body ${responseBody.toString()}');

        return responseBody!;
      } else {
        return {
          'status': 'Failure',
          'message': 'Can\'t connect to internet',
        };
      }
    } catch (e) {
      log('Crud.dart: Error: ${e as String}');
      return {
        'status': 'Failure',
        'message': '404, Server Failure',
      };
    }
  }
}
