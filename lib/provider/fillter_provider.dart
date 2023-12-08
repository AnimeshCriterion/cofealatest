import 'package:flutter/cupertino.dart';

import '../data/model/response/base/api_response.dart';
import '../data/repository/FillterProductsRepo.dart';
import '../helper/api_checker.dart';
import '../view/fillter/dataModel/fillter_brands.dart';
import '../view/fillter/dataModel/fillter_intencity.dart';
import '../view/fillter/dataModel/fillter_products_origin.dart';
import '../view/fillter/dataModel/fillter_types.dart';

class FillterProductsProvider extends ChangeNotifier{

  final FillterProductsRepo giftVoucherRepo;
  FillterProductsProvider({required this.giftVoucherRepo});

  List<FillterBrands> _fillterBrandsList = [];

  List<FillterBrands> get getFillterBrands => _fillterBrandsList;

  List<FillterProductsOrigin> _fillterProductsOrigin = [];

  List<FillterProductsOrigin> get getFillterProductsOrigin => _fillterProductsOrigin;

  List<FillterIntencity> _fillterIntencity = [];

  List<FillterIntencity> get getFillterIntencity => _fillterIntencity;

  List<FillterTypes> _fillterTypes = [];

  List<FillterTypes> get getFillterTypes => _fillterTypes;


  List<String> _SideMenuText = ["Brand","Origin","Intensity","Type","Price"];

  List<String> get getFillterSideText => _SideMenuText;


  int? _categorySelectedIndex;
  int? get categorySelectedIndex => _categorySelectedIndex;
  void changeSelectedIndex(int selectedIndex) {
    _categorySelectedIndex = selectedIndex;
    notifyListeners();
  }



  Future<void> hitGetFillterBrandsApi(BuildContext context,{bool reload = false}) async {
    if(reload) {
      _fillterBrandsList = [];
    }
    ApiResponse apiResponse = await giftVoucherRepo.getFillterBrands();
    if (apiResponse.response != null && apiResponse.response!.statusCode! == 200) {
      _fillterBrandsList = [];
      _fillterBrandsList.addAll(List<FillterBrands>.from((apiResponse.response!.data
          .map((element) => FillterBrands.fromJson(element)))));
      print("CheckData${_fillterBrandsList.toList()}");
      // _lPageSize = GiftVoucherDataModel.fromJson(apiResponse.response.data).totalSize;
      // _firstLoading = false;
      // _isLoading = false;
    } else {
      ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }




  Future<void> hitGetFillterProductsOriginApi(BuildContext context,{bool reload = false}) async {
    if(reload) {
      _fillterProductsOrigin = [];
    }
    ApiResponse apiResponse = await giftVoucherRepo.getFillterProductOrigin();
    if (apiResponse.response != null && apiResponse.response!.statusCode! == 200) {
      _fillterProductsOrigin = [];
      _fillterProductsOrigin.addAll(List<FillterProductsOrigin>.from((apiResponse.response!.data
          .map((element) => FillterProductsOrigin.fromJson(element)))));
      print("CheckData${_fillterProductsOrigin.toList()}");
      // _lPageSize = GiftVoucherDataModel.fromJson(apiResponse.response.data).totalSize;
      // _firstLoading = false;
      // _isLoading = false;
    } else {
      ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }



  Future<void> hitGetFillterIntencityApi(BuildContext context,{bool reload = false}) async {
    if(reload) {
      _fillterIntencity = [];
    }
    ApiResponse apiResponse = await giftVoucherRepo.getFillterIntencity();
    if (apiResponse.response != null && apiResponse.response!.statusCode! == 200) {
      _fillterIntencity = [];
      _fillterIntencity.addAll(List<FillterIntencity>.from((apiResponse.response!.data
          .map((element) => FillterIntencity.fromJson(element)))));
      print("CheckData${_fillterIntencity.toList()}");
      // _lPageSize = GiftVoucherDataModel.fromJson(apiResponse.response.data).totalSize;
      // _firstLoading = false;
      // _isLoading = false;
    } else {
      ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }




  Future<void> hitGetFillterTypesApi(BuildContext context,{bool reload = false}) async {
    if(reload) {
      _fillterTypes = [];
    }
    ApiResponse apiResponse = await giftVoucherRepo.getFillterTypes();
    if (apiResponse.response != null && apiResponse.response!.statusCode! == 200) {
      _fillterTypes = [];
      _fillterTypes.addAll(List<FillterTypes>.from((apiResponse.response!.data
          .map((element) => FillterTypes.fromJson(element)))));
      print("CheckData${_fillterTypes.toList()}");
      // _lPageSize = GiftVoucherDataModel.fromJson(apiResponse.response.data).totalSize;
      // _firstLoading = false;
      // _isLoading = false;
    } else {
      ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }










}