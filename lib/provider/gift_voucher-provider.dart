import 'package:flutter/cupertino.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:provider/provider.dart';

import '../data/model/response/base/api_response.dart';
import '../data/model/response/gift_voucher_data_model.dart';
import '../data/repository/gift_voucher_repo.dart';
import '../helper/api_checker.dart';
import '../view/my_gift_vouchar/myvoucharcartDataModel.dart';

class GiftVoucherProvider extends ChangeNotifier{

  final GiftVoucherRepo giftVoucherRepo;
  GiftVoucherProvider({required this.giftVoucherRepo});

  List<GiftVoucherDataModel> _giftVoucherList = [];

  List<GiftVoucherDataModel> get giftVoucherList => _giftVoucherList;

 List<MygiftVoucharDataModel> _myGiftVoucherList = [];

  List<MygiftVoucharDataModel> get myGiftVoucherList => _myGiftVoucherList;


  Future<void> getVoucherList(BuildContext context,{bool reload = false}) async {
    if(reload) {
      _giftVoucherList = [];
    }
      ApiResponse apiResponse = await giftVoucherRepo.getGiftVoucher();
      if (apiResponse.response != null && apiResponse.response!.statusCode! == 200) {
        _giftVoucherList = [];
        _giftVoucherList.addAll(List<GiftVoucherDataModel>.from((apiResponse.response!.data
            .map((element) => GiftVoucherDataModel.fromJson(element)))));
        print("CheckData${_giftVoucherList.toList()}");
       // _lPageSize = GiftVoucherDataModel.fromJson(apiResponse.response.data).totalSize;
        // _firstLoading = false;
        // _isLoading = false;
      } else {
        ApiChecker.checkApi( apiResponse);
      }
      notifyListeners();
    }



  Future<void> getMyGiftVouchar(BuildContext context,{bool reload = false}) async {
    if(reload) {
      _myGiftVoucherList = [];
    }
    var userId=await Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
    ApiResponse apiResponse = await giftVoucherRepo.getMyGiftVoucher(userId);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _myGiftVoucherList = [];
      _myGiftVoucherList.addAll(List<MygiftVoucharDataModel>.from((apiResponse.response!.data
          .map((element) => MygiftVoucharDataModel.fromJson(element)))));
      notifyListeners();
      print("CheckData"+_giftVoucherList.toList().toString());
      // _lPageSize = GiftVoucherDataModel.fromJson(apiResponse.response.data).totalSize;
      // _firstLoading = false;
      // _isLoading = false;
    } else {
      ApiChecker.checkApi(apiResponse);
    }
    notifyListeners();
  }
    }

