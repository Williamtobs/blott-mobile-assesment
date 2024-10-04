import 'dart:io' show HttpStatus;
import 'package:blott_mobile_assesment/src/data/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';

abstract class BaseApiRepository {
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final response = await request();
      debugPrint('statusCode: ${response.response.statusCode}');
      if (response.response.statusCode == HttpStatus.ok) {
        // debugPrint('response: ${response.data.toString()}');
        return DataSuccess(response.data);
      } else {
        debugPrint('response: ${response.response}');
        return DataError(
          throw DioException(
            requestOptions: response.response.requestOptions,
            response: response.response,
          ),
        );
      }
    } on DioException catch (e) {
      debugPrint('error: $e');
      return DataError(e);
    }
  }

  Stream<DataState<T>> getStreamStateOf<T>({
    required Stream<HttpResponse<T>> Function() request,
  }) async* {
    try {
      final response = request();
      await for (final data in response) {
        if (data.response.statusCode == HttpStatus.ok) {
          yield DataSuccess(data.data!);
        } else {
          yield DataError(
            throw DioException(
              requestOptions: data.response.requestOptions,
              response: data.response,
            ),
          );
        }
      }
    } on DioException catch (e) {
      yield DataError(e);
    }
  }
}
