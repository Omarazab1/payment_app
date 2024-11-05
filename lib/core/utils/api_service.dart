import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
   Future<Response> post({required String url , required String body , required String token ,String? contentType}) async
   {
     var response = await _dio.post(url, data: body, options: Options(
         headers: {"Authorization": "Bearer $token"},
         contentType: contentType,
     ));
     return response;
   }
}