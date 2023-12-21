import 'package:dartz/dartz.dart';
import 'package:ga_proj/backend/err/errors.dart';

abstract class IHttpInterfacePostPut {
  Future<Either<HttpRequestFailure, dynamic>> makeJsonRequest(
      {required String url, params});
}

abstract class IHttpInterfaceGet {
  Future<Either<HttpRequestFailure, dynamic>> makeGetJsonRequest(
      {required String url, String? params});
}
