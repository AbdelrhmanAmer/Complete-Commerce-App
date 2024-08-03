import 'dart:convert';
import 'package:dio/dio.dart';
import '../functions/check_internet.dart';

class Crud {
  Future<Map<String, dynamic>> postData(
      String url, Map<String, dynamic> data) async {
    try {
      if (await checkInternet()) {
        final dio = Dio();
        final response = await dio.post(url, data: FormData.fromMap(data));
        print('-------------------------------------');
        print('Crud.dart: dio Response ${response.data}  ');
        print('Crud.dart: response.statusCode ${response.statusCode} ');

        Map<String, dynamic>? responseBody;

        if (response.data is String) {
          responseBody = jsonDecode(response.data);
        } else if (response.data is Map) {
          responseBody = response.data as Map<String, dynamic>;
        }

        print('Crud.dart: response.body $responseBody ');

        return responseBody!;
      } else {
        return {
          'status': 'Failure',
          'message': 'Can\'t connect to internet',
        };
      }
    } catch (e) {
      print('Crud.dart: Error: $e');
      return {
        'status': 'Failure',
        'message': '404, Server Failure $e',
      };
    }
  }
}
