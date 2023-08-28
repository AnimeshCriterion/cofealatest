import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/coupon_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/coupon_repo.dart';
import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/show_custom_snakbar.dart';

class CouponProvider extends ChangeNotifier {
  final CouponRepo? couponRepo;
  CouponProvider({required this.couponRepo});

  CouponModel? _coupon;
  VoucharModel? _vouchar;
  double _discount=0.0;
  bool _isLoading = false;
  CouponModel? get coupon => _coupon;
  double _walletDiscount=0.0;
  double? get discount => _discount;
  bool get isLoading => _isLoading;
  VoucharModel? get vouchar => _vouchar;
  String _couponCode = '';
  double get walletDiscount => _walletDiscount;
  String get couponCode => _couponCode;

  Future<double> initCoupon(String coupon, double order) async {
    _isLoading = true;
    _discount = 0;
    notifyListeners();
    ApiResponse apiResponse = await couponRepo!.getCoupon(coupon);
    if (apiResponse.response != null && apiResponse.response.toString() != '{}' && apiResponse.response!.statusCode == 200) {
      _coupon = CouponModel.fromJson(apiResponse.response!.data);
      if (_coupon!.minPurchase != null && _coupon!.minPurchase! < order) {
        if(_coupon!.discountType == 'percent' || _coupon!.discountType == 'percentage' ) {
          _discount = (_coupon!.discount! * order / 100) < _coupon!.maxDiscount!
              ? (_coupon!.discount! * order / 100) : _coupon!.maxDiscount!;
        }else {
          _discount = _coupon!.discount!;
        }
      } else {
        _discount = 0;
      }
    } else {
      print(apiResponse.error.toString());
      _discount = 0;
      notifyListeners();
    }
    _isLoading = false;
    notifyListeners();
    return _discount;
  }

  Future<double> initVouchars(String coupon, double order) async {
    _isLoading = true;
    _discount = 0;
    _vouchar=new VoucharModel();
    notifyListeners();
    ApiResponse apiResponse = await couponRepo!.voucharApply(coupon);
    if (apiResponse.response != null && apiResponse.response.toString() != '{}' && apiResponse.response!.statusCode == 200) {
      print("AnimeshCheckVouchar"+apiResponse.response!.data.toString());
      _vouchar = VoucharModel.fromJson(apiResponse.response!.data);
      if (_vouchar!.minPurchase != null && _vouchar!.minPurchase! < order) {
        if(_vouchar!.discountType == 'percent' || _vouchar!.discountType == 'percentage' ) {
          _discount = ((_vouchar!.discount! * order / 100) < _vouchar!.maxDiscount!
              ? (_vouchar!.discount! * order / 100) : _vouchar!.maxDiscount)!;
        }else {
          _discount = double.parse(_vouchar!.discount.toString());
        }
      } else {
        _discount = 0;
      }
    } else {
      print(apiResponse.error.toString());
      _discount = 0;
      notifyListeners();
    }
    _isLoading = false;
    notifyListeners();
    return _discount;
  }


  set setDiscount(val){
    _discount=0.0;
    _discount += val;
    notifyListeners();

  }

  set sewallet(val){
    _walletDiscount=val;
    notifyListeners();

  }


  void removePrevCouponData() {
    _coupon = null;
    _isLoading = false;
    _discount = 0.0;
    _coupon = null;
  }
}
