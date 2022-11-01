// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiRepository {
  final String url;
  final Map<String, dynamic>? payload;

  ApiRepository({required this.url, this.payload});

  final Dio _dio = Dio();

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio.get(url, queryParameters: payload).then((response) {
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
      }
    });
  }
}
