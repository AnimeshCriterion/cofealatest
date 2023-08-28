import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/helper/product_type.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';

class GiftVoucherRepo {
  final DioClient dioClient;
  GiftVoucherRepo({required this.dioClient});


  //Seller Products
  Future<ApiResponse> getGiftVoucher() async {
    try {
      final response = await dioClient.get(
          AppConstants.GIFT_VOUCHER_API);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> getMyGiftVoucher(String userId) async {
    try {
      final response = await dioClient.get(
          AppConstants.MY_GIFT_VOUCHER_API+"?user_id=${userId}");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}