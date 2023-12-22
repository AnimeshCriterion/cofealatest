import '../../utill/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class FillterProductsRepo{



  final DioClient dioClient;
  FillterProductsRepo({required this.dioClient});



  Future<ApiResponse> getFillterBrands(String id) async {
    try {
      final response = await dioClient.post(
          AppConstants.fillterBrands+id);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> getFillterProductOrigin(String id) async {
    try {
      final response = await dioClient.post(
          AppConstants.fillterProductsOrigin+id);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> getFillterIntencity(String id) async {
    try {
      final response = await dioClient.post(
          AppConstants.fillterIntencity+id);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> getFillterTypes(String id) async {
    try {
      final response = await dioClient.post(
          AppConstants.fillterTypes+id);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}