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

  List<int> selectedBrands=[];
  List<String> selectedTypes=[];
  List<String> selectedOrigin=[];
  List<String> selectedIntencity=[];


  final List<String> _SideMenuText = ["Brand","Origin","Intencity","Type"];

  List<String> get getFillterSideText => _SideMenuText;


  int? _categorySelectedIndex=0;
  int? get categorySelectedIndex => _categorySelectedIndex;
  void changeSelectedIndex(int selectedIndex) {
    _categorySelectedIndex = selectedIndex;
    notifyListeners();
  }


  void updateIsSelectForBrands(isSelect,index){
    getFillterBrands[index].isSelect=isSelect;
    notifyListeners();
  }


   clearAllFillter(){
    selectedIntencity=[];
    selectedOrigin=[];
    selectedBrands=[];
    selectedTypes=[];
    _categorySelectedIndex=0;
    notifyListeners();
  }

  void updateIsSelectForOrigin(isSelect,index){
    getFillterProductsOrigin[index].isSelect=isSelect;
    notifyListeners();
  }

  void updateIsSelectForIntencity(isSelect,index){
    getFillterIntencity[index].isSelect=isSelect;
    notifyListeners();
  }

  void updateIsSelectForTypes(isSelect,index){
    getFillterTypes[index].isSelect=isSelect;
    notifyListeners();
  }


  updateAllListData(){
    for(int i=0;i<getFillterTypes.length;i++){
      getFillterTypes[i].isSelect=false;
    };
    for(int i=0;i<getFillterIntencity.length;i++){
      getFillterIntencity[i].isSelect=false;
    };
    for(int i=0;i<getFillterProductsOrigin.length;i++){
      getFillterProductsOrigin[i].isSelect=false;
    };
    for(int i=0;i<getFillterBrands.length;i++){
      getFillterBrands[i].isSelect=false;
    };
    notifyListeners();
  }




  void addSelectedBrands(selectedBrandId ){
    if(!selectedBrands.contains(selectedBrandId)){
      selectedBrands.add(int.parse(selectedBrandId.toString()));
    }else{
      selectedBrands.remove(int.parse(selectedBrandId.toString()));
    }
    notifyListeners();
    print("Animehs${selectedBrands.toList()}");
  }



  void addSelectedTypes(selectedBrandId ){
    if(!selectedTypes.contains(selectedBrandId)){
      selectedTypes.add(selectedBrandId.toString());
    }else{
      selectedTypes.remove(selectedBrandId.toString());
    }
    notifyListeners();
    print("Animehs${selectedTypes.toList()}");
  }



  void addSelectedOrigin(selectedBrandId ){
    if(!selectedOrigin.contains(selectedBrandId)){
      selectedOrigin.add(selectedBrandId.toString());
    }else{
      selectedOrigin.remove(selectedBrandId.toString());
    }
    notifyListeners();
    print("Animehs${selectedOrigin.toList()}");
  }



  void addSelectedIntencity(selectedBrandId ){
    if(!selectedIntencity.contains(selectedBrandId)){
      selectedIntencity.add(selectedBrandId.toString());
    }else{
      selectedIntencity.remove(selectedBrandId.toString());
    }
    notifyListeners();
    print("Animehs${selectedIntencity.toList()}");
  }





  Future<void> hitGetFillterBrandsApi(BuildContext context,{bool reload = false,required String id}) async {
    if(reload) {
      _fillterBrandsList = [];
    }
    ApiResponse apiResponse = await giftVoucherRepo.getFillterBrands(id);
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




  Future<void> hitGetFillterProductsOriginApi(BuildContext context,{bool reload = false,required String id}) async {
    if(reload) {
      _fillterProductsOrigin = [];
    }
    ApiResponse apiResponse = await giftVoucherRepo.getFillterProductOrigin(id);
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



  Future<void> hitGetFillterIntencityApi(BuildContext context,{bool reload = false,required String id}) async {
    if(reload) {
      _fillterIntencity = [];
    }
    ApiResponse apiResponse = await giftVoucherRepo.getFillterIntencity(id);
    if (apiResponse.response != null && apiResponse.response!.statusCode! == 200) {
      _fillterIntencity = [];
      _fillterIntencity.addAll(List<FillterIntencity>.from((apiResponse.response!.data
          .map((element) => FillterIntencity.fromJson(element)))));
      print("CheckDataintencity${_fillterIntencity.toList()}");
      // _lPageSize = GiftVoucherDataModel.fromJson(apiResponse.response.data).totalSize;
      // _firstLoading = false;
      // _isLoading = false;
    } else {
      ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }




  Future<void> hitGetFillterTypesApi(BuildContext context,{bool reload = false,required String id}) async {
    if(reload) {
      _fillterTypes = [];
    }
    ApiResponse apiResponse = await giftVoucherRepo.getFillterTypes(id);
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