import 'dart:io';

import 'package:an_cu/Model/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationService = Provider((ref) => LocationService());

class LocationService {
  final _url = 'https://provinces.open-api.vn/api/';

  Future<List<Province>> getProvinces() async {
    try {
      final response = await Dio().get("$_url?depth=2");
      if (response.statusCode == 200) {
        final data = response.data as List;
        List<Province> provinces =
            data.map((json) => Province.fromJson(json)).toList();
        return provinces;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse &&
          e.response?.statusCode == 404) {
        throw Exception('Resource not found');
      } else {
        throw Exception('Failed to load data: ${e.message}');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    }
  }
}
