import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/helper/product_type.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../provider/fillter_provider.dart';

class ProductRepo {
  final DioClient? dioClient;
  ProductRepo({required this.dioClient});

  Future<ApiResponse> getLatestProductList(BuildContext context, String offset, ProductType productType, String? title) async {
    late String endUrl;

     if(productType == ProductType.bestSelling){
      endUrl = AppConstants.bestSellingProductUri;
      title = getTranslated('best_selling', context);
    }
    else if(productType == ProductType.newArrival){
      endUrl = AppConstants.newArrivalProductUri;
      title = getTranslated('new_arrival',context);
    }
    else if(productType == ProductType.topProduct){
      endUrl = AppConstants.topProductUri;
      title = getTranslated('top_product', context);
    }else if(productType == ProductType.discountedProduct){
       endUrl = AppConstants.discountedProductUri;
       title = getTranslated('discounted_product', context);
     }

    try {
      final response = await dioClient!.get(
        endUrl+offset);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  //Seller Products
  Future<ApiResponse> getSellerProductList(String sellerId, String offset, [String search = '']) async {
    try {
      final response = await dioClient!.get(
        '${AppConstants.sellerProductUri}$sellerId/products?limit=10&&offset=$offset&search=$search');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getBrandOrCategoryProductList(bool isBrand, String id) async {
    print("CheckkkkkID$id");
     try {
      String uri;
      final response;
      if(isBrand){
        print("brandrun");
        uri = '${AppConstants.brandProductUri}$id';
         response = await dioClient!.get(uri);
      }else {

        uri = '${AppConstants.categoryProductUri}$id';
    //  var body=   {
    //       "selectedBrands":145,
    // "product_origin":"",
    // "intencities":"",
    // "types":""
    // };
         response = await dioClient!.post(uri, );
      }

      print("ANimeshshshsh0$uri");
      return ApiResponse.withSuccess(response);

     } catch (e) {

       print("ANimeshshshsh0$e");
       return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  

  Future<ApiResponse> getCategoryProductListFillter( String id,String selectedBrands, String selectedTypes, String selectedOrigin, String selectedIntencity) async {
    try {
      String uri;
      final response;
      print("AnimeshCheckBackinApi${selectedBrands.toString().replaceAll("[", "").replaceAll("]", "")}");
      print("AnimeshCheckBackinApi${selectedTypes.toString().replaceAll("[", "").replaceAll("]", "")}");
      print("AnimeshCheckBackinApi${selectedOrigin.toString().replaceAll("[", "").replaceAll("]", "")}");
      print("AnimeshCheckBackinApi${selectedIntencity.toString().replaceAll("[", "").replaceAll("]", "")}");
        uri = '${AppConstants.categoryProductUri}$id';
        var body=   {
          "selectedBrands":selectedBrands.toString().replaceAll("[", "").replaceAll("]", ""),
          "product_origin":selectedOrigin.toString().replaceAll("[", "").replaceAll("]", ""),
          "intencities":selectedIntencity.toString().replaceAll("[", "").replaceAll("]", ""),
          "types":selectedTypes.toString().replaceAll("[", "").replaceAll("]", "")
        };

        print("Request$body");
        response = await dioClient!.post(uri,data:body );



      return ApiResponse.withSuccess(response);

    } catch (e) {
      print("ANimeshshshsh0$e");
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }



  Future<ApiResponse> getRelatedProductList(String id) async {
    try {
      final response = await dioClient!.get(
        AppConstants.relatedProductUri+id);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> getFeaturedProductList(String offset) async {
    try {
      final response = await dioClient!.get(
        AppConstants.featuredProductUri+offset,);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> getLProductList(String offset) async {
    try {
      final response = await dioClient!.get(
        AppConstants.latestProductUri+offset,);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print("Animesh Singh$e");
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getRecommendedProduct() async {
    try {
      final response = await dioClient!.get(AppConstants.dealOfTheDay);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}