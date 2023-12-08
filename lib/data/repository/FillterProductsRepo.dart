import '../../utill/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class FillterProductsRepo{



  final DioClient dioClient;
  FillterProductsRepo({required this.dioClient});



  Future<ApiResponse> getFillterBrands() async {
    try {
      final response = await dioClient.get(
          AppConstants.fillterBrands);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> getFillterProductOrigin() async {
    try {
      final response = await dioClient.get(
          AppConstants.fillterProductsOrigin);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> getFillterIntencity() async {
    try {
      final response = await dioClient.get(
          AppConstants.fillterIntencity);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> getFillterTypes() async {
    try {
      final response = await dioClient.get(
          AppConstants.fillterTypes);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}