import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_constant.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/data/model/MovieDm.dart';

@singleton
class ApiManager {
  Dio dio = Dio();

  Future<Response> getData({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParam,
  }) {
    return dio.get(
      "${ApiConstant.serverName}$endPoint",
      queryParameters: queryParam,
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
    );
  }
}
