import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/body/order_place_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/cart_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/main.dart';
import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/coupon_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/order_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:get/get.dart' as getx ;
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/amount_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/animated_custom_dialog.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/my_dialog.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/textfield/custom_textfield.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/address/saved_address_list_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/address/saved_billing_Address_list_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/checkout/widget/custom_check_box.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/payment/payment_screen.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  final List<CartModel>? cartList;
  final bool? fromProductDetails;
  final double? totalOrderAmount;
  final double? shippingFee;
  final double? discount;
  final double? tax;
  final int? sellerId;
  final bool? onlyDigital;

  CheckoutScreen({Key? key, @required this.cartList, this.fromProductDetails = false,
    @required this.discount, @required this.tax, @required this.totalOrderAmount, @required this.shippingFee, this.sellerId, this.onlyDigital = false}) : super(key: key);


  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _voucharcontroller = TextEditingController();
  final TextEditingController _walletcontroller = TextEditingController();
  final TextEditingController _orderNoteController = TextEditingController();
  final FocusNode _orderNoteNode = FocusNode();
  double _order = 0;
  bool? _digitalPayment;
  String balanceWallet = "";


  bool? _cod;
  bool? _billingAddress;
  int subscriptionIndex = 0;
  int selected = 0;

  getWalletbalance() async {

    await Provider.of<ProfileProvider>(context, listen: false)
        .getUserWalletBalance(context)
        .then((value) {
       setState(() {
         balanceWallet = value.toString();
         print("ANiejhs$balanceWallet");
       });

    });
  }

  @override
  void initState() {
    super.initState();
    getWalletbalance();

    Provider.of<ProfileProvider>(context, listen: false).initAddressList();
    Provider.of<ProfileProvider>(context, listen: false).initAddressTypeList(context);
    Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
    Provider.of<CouponProvider>(context, listen: false).removePrevCouponData();
    Provider.of<CartProvider>(context, listen: false).getCartDataAPI(context);
    Provider.of<CartProvider>(context, listen: false).getChosenShippingMethod(context);
    _digitalPayment = Provider.of<SplashProvider>(context, listen: false).configModel!.digitalPayment;
    _cod = Provider.of<SplashProvider>(context, listen: false).configModel!.cod;
    Provider.of<CouponProvider>(context, listen: false).sewallet = 0.0;
    _billingAddress = Provider.of<SplashProvider>(context, listen: false).configModel!.billingAddress == 1;
  }


  @override
  Widget build(BuildContext context) {
    _order = (widget.totalOrderAmount! + widget.discount!);
    print("Animesh$_billingAddress");
    // setState(() {
    //   getWalletbalance();
    // });
    return Scaffold(

      resizeToAvoidBottomInset: true,
     key: _scaffoldKey,

      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE,
            vertical: Dimensions.PADDING_SIZE_DEFAULT),
        decoration: BoxDecoration(
          color: ColorResources.getPrimary(context),
        ),
        child: Center(
          child: Consumer<OrderProvider>(
            builder: (context, order, child) {
              return !Provider
                  .of<OrderProvider>(context)
                  .isLoading! ? Builder(
                builder: (context) =>
                    InkWell(
                      onTap: () async {
                        var data=Provider.of<OrderProvider>(context, listen: false).addressIndex;
                        var data1=Provider.of<OrderProvider>(context, listen: false).billingAddressIndex;
                        if (Provider
                            .of<OrderProvider>(context, listen: false)
                            .addressIndex == -1 && !widget.onlyDigital!) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(getTranslated(
                                  'select_a_shipping_address', context)!),
                              backgroundColor: Colors.red));
                        } else if (Provider
                            .of<OrderProvider>(context, listen: false)
                            .billingAddressIndex == -1 && _billingAddress!) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(getTranslated(
                                  'select_a_billing_address', context)!),
                              backgroundColor: Colors.red));
                        }

                        else {
                          List<CartModel> _cartList = [];
                          _cartList.addAll(widget.cartList!);

                          for (int index = 0; index <
                              widget.cartList!.length; index++) {
                            for (int i = 0; i < Provider
                                .of<CartProvider>(context, listen: false)
                                .chosenShippingList
                                .length; i++) {
                              if (Provider
                                  .of<CartProvider>(context, listen: false)
                                  .chosenShippingList[i].cartGroupId ==
                                  widget.cartList![index].cartGroupId) {
                                _cartList[index].shippingMethodId = Provider
                                    .of<CartProvider>(context, listen: false)
                                    .chosenShippingList[i].id;
                                break;
                              }
                            }
                          }

                          String orderNote = _orderNoteController.text.trim();
                          double? couponDiscount = Provider
                              .of<CouponProvider>(context, listen: false)
                              .discount != null ?
                          Provider
                              .of<CouponProvider>(context, listen: false)
                              .discount : 0;
                          String? couponCode = Provider
                              .of<CouponProvider>(context, listen: false)
                              .discount != null &&
                              Provider
                                  .of<CouponProvider>(context, listen: false)
                                  .discount != 0 ?
                          Provider
                              .of<CouponProvider>(context, listen: false)
                              .coupon
                              !=null? Provider
                              .of<CouponProvider>(context, listen: false)
                              .coupon!
                              .code:""
                              : '';
                          if (_cod! && Provider
                              .of<OrderProvider>(context, listen: false)
                              .paymentMethodIndex == 0 && !widget.onlyDigital!) {
                            Provider.of<OrderProvider>(context, listen: false)
                                .placeOrder(
                                OrderPlaceModel(
                                  CustomerInfo(
                                      widget.onlyDigital! ? '' :
                                      Provider
                                          .of<ProfileProvider>(
                                          context, listen: false)
                                          .addressList[Provider
                                          .of<OrderProvider>(
                                          context, listen: false)
                                          .addressIndex!].id.toString(),
                                      widget.onlyDigital! ? '' :
                                      Provider
                                          .of<ProfileProvider>(
                                          context, listen: false)
                                          .addressList[Provider
                                          .of<OrderProvider>(
                                          context, listen: false)
                                          .addressIndex!].address!,
                                      _billingAddress! ?
                                      Provider
                                          .of<ProfileProvider>(
                                          context, listen: false)
                                          .billingAddressList[Provider
                                          .of<OrderProvider>(
                                          context, listen: false)
                                          .billingAddressIndex!].id.toString() :
                                      Provider
                                          .of<ProfileProvider>(
                                          context, listen: false)
                                          .addressList[Provider
                                          .of<OrderProvider>(
                                          context, listen: false)
                                          .addressIndex!].id.toString(),
                                      _billingAddress! ?
                                      Provider
                                          .of<ProfileProvider>(
                                          context, listen: false)
                                          .billingAddressList[Provider
                                          .of<OrderProvider>(
                                          context, listen: false)
                                          .billingAddressIndex!].address! :
                                      Provider
                                          .of<ProfileProvider>(
                                          context, listen: false)
                                          .addressList[Provider
                                          .of<OrderProvider>(
                                          context, listen: false)
                                          .addressIndex!].address!,
                                      orderNote


                                  ),
                                  _cartList, order.paymentMethodIndex == 0 &&
                                    !widget.onlyDigital!
                                    ? 'cash_on_delivery'
                                    : '', couponDiscount!,
                                ),
                                _callback,
                                _cartList,
                                widget.onlyDigital! ? '' :
                                Provider
                                    .of<ProfileProvider>(context, listen: false)
                                    .addressList[Provider
                                    .of<OrderProvider>(context, listen: false)
                                    .addressIndex!].id.toString(),
                                couponCode!,
                                _billingAddress! ?
                                Provider
                                    .of<ProfileProvider>(context, listen: false)
                                    .billingAddressList[Provider
                                    .of<OrderProvider>(context, listen: false)
                                    .billingAddressIndex!].id.toString() :
                                widget.onlyDigital! ? '' :
                                Provider
                                    .of<ProfileProvider>(context, listen: false)
                                    .addressList[Provider
                                    .of<OrderProvider>(context, listen: false)
                                    .addressIndex!].id.toString(),
                                orderNote);
                          }
                          else {
                            String userID = await Provider.of<ProfileProvider>(
                                context, listen: false).getUserInfo(context);

                                // if it is mounted then go to result screen, time is off bro..

                            getx.Get.to(  PaymentScreen(
                              customerID: userID,
                              addressID: widget.onlyDigital! ? '' :
                              Provider
                                  .of<ProfileProvider>(
                                  context, listen: false)
                                  .addressList[Provider
                                  .of<OrderProvider>(context, listen: false)
                                  .addressIndex!].id.toString(),
                              couponCode: Provider
                                  .of<CouponProvider>(
                                  context, listen: false)
                                  .discount != null ? Provider
                                  .of<CouponProvider>(
                                  context, listen: false)
                                  .coupon!=null?Provider
                                  .of<CouponProvider>(
                                  context, listen: false)
                                  .coupon!.code!:"0" : '',
                              billingId: _billingAddress! ?
                              Provider
                                  .of<ProfileProvider>(
                                  context, listen: false)
                                  .billingAddressList[Provider
                                  .of<OrderProvider>(context, listen: false)
                                  .billingAddressIndex!].id.toString() :
                              widget.onlyDigital! ? '' :
                              Provider
                                  .of<ProfileProvider>(
                                  context, listen: false)
                                  .addressList[Provider
                                  .of<OrderProvider>(context, listen: false)
                                  .addressIndex!].id.toString(),
                              orderNote: orderNote,
                              walletBalance: Provider
                                  .of<CouponProvider>(
                                  context, listen: false)
                                  .walletDiscount
                                  .toString(),
                              voucharCode: Provider
                                  .of<CouponProvider>(
                                  context, listen: false)
                                  .vouchar!=null? Provider
                                  .of<CouponProvider>(
                                  context, listen: false)
                                  .vouchar!.code:"0",

                            ));

                                // Navigator.pushReplacement(
                                //     context, MaterialPageRoute(builder: (_) =>
                                //     PaymentScreen(
                                //       customerID: userID,
                                //       addressID: widget.onlyDigital! ? '' :
                                //       Provider
                                //           .of<ProfileProvider>(
                                //           context, listen: false)
                                //           .addressList[Provider
                                //           .of<OrderProvider>(context, listen: false)
                                //           .addressIndex!].id.toString(),
                                //       couponCode: Provider
                                //           .of<CouponProvider>(
                                //           context, listen: false)
                                //           .discount != null ? Provider
                                //           .of<CouponProvider>(
                                //           context, listen: false)
                                //           .coupon!=null?Provider
                                //           .of<CouponProvider>(
                                //           context, listen: false)
                                //           .coupon!.code!:"0" : '',
                                //       billingId: _billingAddress! ?
                                //       Provider
                                //           .of<ProfileProvider>(
                                //           context, listen: false)
                                //           .billingAddressList[Provider
                                //           .of<OrderProvider>(context, listen: false)
                                //           .billingAddressIndex!].id.toString() :
                                //       widget.onlyDigital! ? '' :
                                //       Provider
                                //           .of<ProfileProvider>(
                                //           context, listen: false)
                                //           .addressList[Provider
                                //           .of<OrderProvider>(context, listen: false)
                                //           .addressIndex!].id.toString(),
                                //       orderNote: orderNote,
                                //       walletBalance: Provider
                                //           .of<CouponProvider>(
                                //           context, listen: false)
                                //           .walletDiscount
                                //           .toString(),
                                //       voucharCode: Provider
                                //           .of<CouponProvider>(
                                //           context, listen: false)
                                //           .vouchar!=null? Provider
                                //           .of<CouponProvider>(
                                //           context, listen: false)
                                //           .vouchar!.code:"0",
                                //
                                //     )));
                              }

                        }
                      },

                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery
                            .of(context)
                            .size
                            .width / 2.9),
                        child: Text(getTranslated('proceed', context)!,
                            style: titilliumSemiBold.copyWith(
                              fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                              color: Theme
                                  .of(context)
                                  .cardColor,
                            )),
                      ),
                    ),
              ) : Container(
                height: 30, width: 30, alignment: Alignment.center,
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Theme
                        .of(context)
                        .highlightColor)),
              );
            },
          ),
        ),
      ),

      body: Column(
        children: [
          CustomAppBar(title: getTranslated('checkout', context)),
          Expanded(
            child: ListView(physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0),
                children: [

                  // Shipping Details
                  Consumer<OrderProvider>(
                      builder: (context, shipping, _) {
                        return Container(
                          padding: const EdgeInsets.all(
                              Dimensions.PADDING_SIZE_SMALL),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // widget.onlyDigital! ?
                                Card(
                                  child: Container(
                                    padding: const EdgeInsets.all(
                                        Dimensions.PADDING_SIZE_DEFAULT),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.PADDING_SIZE_DEFAULT),
                                      color: Theme
                                          .of(context)
                                          .cardColor,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment
                                            .start,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Expanded(child: Text(
                                                '${getTranslated(
                                                    'shipping_address',
                                                    context)}',
                                                style: titilliumRegular
                                                    .copyWith(
                                                    fontWeight: FontWeight
                                                        .w600))),


                                            InkWell(
                                              onTap: () =>
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (
                                                              BuildContext context) =>
                                                              const SavedAddressListScreen())),
                                              child: Image.asset(
                                                  Images.address, scale: 3,color:Theme
                                                  .of(context)
                                                  .primaryColor),
                                            ),

                                          ],
                                        ),
                                        const SizedBox(height: Dimensions
                                            .PADDING_SIZE_DEFAULT,),

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Container(
                                              child: Text(
                                                Provider
                                                    .of<OrderProvider>(
                                                    context, listen: false)
                                                    .addressIndex == -1 ?
                                                '${getTranslated(
                                                    'address_type', context)!}' :
                                                Provider
                                                    .of<ProfileProvider>(
                                                    context, listen: false)
                                                    .addressList[
                                                Provider
                                                    .of<OrderProvider>(
                                                    context, listen: false)
                                                    .addressIndex!].addressType!,
                                                style: titilliumBold.copyWith(
                                                    fontSize: Dimensions
                                                        .FONT_SIZE_LARGE),
                                                maxLines: 3,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                            const Divider(),
                                            Container(
                                              child: Text(
                                                Provider
                                                    .of<OrderProvider>(
                                                    context, listen: false)
                                                    .addressIndex == -1
                                                    ?
                                                getTranslated(
                                                    'add_your_address', context)!
                                                    :
                                                Provider
                                                    .of<ProfileProvider>(
                                                    context, listen: false)
                                                    .addressList[
                                                shipping.addressIndex==-1?0: shipping.addressIndex!].address!,
                                                style: titilliumRegular
                                                    .copyWith(
                                                    fontSize: Dimensions
                                                        .FONT_SIZE_SMALL),
                                                maxLines: 3,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                    // : const SizedBox()
                                ,

                                SizedBox(height: !widget.onlyDigital!
                                    ? Dimensions.PADDING_SIZE_SMALL
                                    : 0),
                                _billingAddress! ?
                                Card(
                                  child: Container(
                                    padding: const EdgeInsets.all(
                                        Dimensions.PADDING_SIZE_DEFAULT),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.PADDING_SIZE_DEFAULT),
                                      color: Theme
                                          .of(context)
                                          .cardColor,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment
                                            .start,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Expanded(child: Text(
                                                '${getTranslated(
                                                    'billing_address',
                                                    context)}',
                                                style: titilliumRegular
                                                    .copyWith(
                                                    fontWeight: FontWeight
                                                        .w600))),


                                            InkWell(
                                              onTap: () =>
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (
                                                              BuildContext context) =>
                                                              const SavedBillingAddressListScreen())),
                                              child: Image.asset(
                                                  Images.address, scale: 3,color:Theme
                            .of(context)
                            .primaryColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: Dimensions
                                            .PADDING_SIZE_DEFAULT,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Container(
                                              child: Text(
                                                Provider
                                                    .of<OrderProvider>(context)
                                                    .billingAddressIndex == -1
                                                    ? '${getTranslated(
                                                    'address_type', context)!}'
                                                    : Provider
                                                    .of<ProfileProvider>(
                                                    context, listen: false)
                                                    .billingAddressList[
                                                Provider
                                                    .of<OrderProvider>(
                                                    context, listen: false)
                                                    .billingAddressIndex!]
                                                    .addressType!,
                                                style: titilliumBold.copyWith(
                                                    fontSize: Dimensions
                                                        .FONT_SIZE_LARGE),
                                                maxLines: 1,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                            const Divider(),
                                            Container(
                                              child: Text(
                                                Provider
                                                    .of<OrderProvider>(context)
                                                    .billingAddressIndex == -1
                                                    ? getTranslated(
                                                    'add_your_address', context)!
                                                    : Provider
                                                    .of<ProfileProvider>(
                                                    context, listen: false)
                                                    .billingAddressList[
                                                shipping.billingAddressIndex!]
                                                    .address!,
                                                style: titilliumRegular
                                                    .copyWith(
                                                    fontSize: Dimensions
                                                        .FONT_SIZE_SMALL),
                                                maxLines: 3,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ) : const SizedBox(),
                              ]),
                        );
                      }
                  ),
                  const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                  // Order Details
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                    child: Text(getTranslated('ORDER_DETAILS', context)!,
                      style: robotoBold.copyWith(
                          fontSize: Dimensions.FONT_SIZE_LARGE),),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: Provider
                            .of<CartProvider>(context, listen: false)
                            .cartList
                            .length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.all(
                                Dimensions.PADDING_SIZE_DEFAULT),
                            child: Row(children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: .5, color: Theme
                                      .of(context)
                                      .primaryColor
                                      .withOpacity(.25)),
                                  borderRadius: BorderRadius.circular(Dimensions
                                      .PADDING_SIZE_EXTRA_EXTRA_SMALL),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(Dimensions
                                      .PADDING_SIZE_EXTRA_EXTRA_SMALL),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: Images.placeholder,
                                    fit: BoxFit.cover,
                                    width: 50,
                                    height: 50,
                                    image: '${Provider
                                        .of<SplashProvider>(
                                        context, listen: false)
                                        .baseUrls!
                                        .productThumbnailUrl}'
                                        '/${Provider
                                        .of<CartProvider>(
                                        context, listen: false)
                                        .cartList[index].thumbnail}',
                                    imageErrorBuilder: (c, o, s) =>
                                        Image.asset(
                                            Images.placeholder,
                                            fit: BoxFit.cover,
                                            width: 50,
                                            height: 50),
                                  ),
                                ),
                              ),
                              const SizedBox(width: Dimensions.MARGIN_SIZE_DEFAULT),
                              Expanded(
                                flex: 3,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          Provider
                                              .of<CartProvider>(
                                              context, listen: false)
                                              .cartList[index].name!,
                                          style: titilliumRegular.copyWith(
                                              fontSize: Dimensions
                                                  .FONT_SIZE_DEFAULT,
                                              color: ColorResources.getPrimary(
                                                  context)),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Dimensions.PADDING_SIZE_SMALL,),
                                      Text(PriceConverter.convertPrice(
                                          context, Provider
                                          .of<CartProvider>(
                                          context, listen: false)
                                          .cartList[index].price),
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions
                                                .FONT_SIZE_LARGE),),

                                    ],
                                  ),
                                  const SizedBox(height: Dimensions
                                      .MARGIN_SIZE_EXTRA_SMALL),

                                  Row(children: [

                                    Text('${getTranslated('qty', context)} - ' +
                                        ' ' + Provider
                                        .of<CartProvider>(
                                        context, listen: false)
                                        .cartList[index].quantity.toString(),
                                        style: titilliumRegular.copyWith()),

                                  ]),
                                ]),
                              ),
                            ]),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: Dimensions.PADDING_SIZE_DEFAULT,
                        right: Dimensions.PADDING_SIZE_DEFAULT),
                    child: Container(
                      height: 25,
                      child: ToggleButtons(
                        fillColor: Colors.black,
                        isSelected: [
                          subscriptionIndex == 0,
                          subscriptionIndex == 1,
                          // subscriptionIndex == 2
                        ],
                        onPressed: (index) {
                          setState(() {
                            subscriptionIndex = index;
                            selected = index;
                          });
                        },
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(getTranslated('coupons', context)!, style: TextStyle(
                                color: subscriptionIndex == 1 ||
                                    subscriptionIndex == 2
                                    ? Colors.black
                                    : Colors.white),),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(getTranslated('voucher', context)!, style: TextStyle(
                                color: subscriptionIndex == 0 ||
                                    subscriptionIndex == 2
                                    ? Colors.black
                                    : Colors.white),),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 16.0),
                          //   child: Text('Wallet', style: TextStyle(
                          //       color: subscriptionIndex==0|| subscriptionIndex==1?Colors.black: Colors.white),),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  // Coupon
                  Visibility(
                    visible: subscriptionIndex == 0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: Dimensions.PADDING_SIZE_DEFAULT,
                          right: Dimensions.PADDING_SIZE_DEFAULT,
                          bottom: Dimensions.PADDING_SIZE_DEFAULT),
                      child: Container(height: 50,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                            color: ColorResources.couponColor(context)
                                .withOpacity(.5),
                            borderRadius: BorderRadius.circular(
                                Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            border: Border.all(width: .5, color: Theme
                                .of(context)
                                .primaryColor
                                .withOpacity(.9))
                        ),
                        child: Row(children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: Dimensions.PADDING_SIZE_SMALL,
                                    bottom: 5),
                                child: Center(
                                  child: TextField(controller: _controller,
                                      decoration: InputDecoration(
                                        hintText:getTranslated('have_a_coupon?', context),
                                        hintStyle: titilliumRegular.copyWith(
                                            fontSize: Dimensions
                                                .FONT_SIZE_DEFAULT),
                                        filled: false,
                                        fillColor: ColorResources.getIconBg(
                                            context),
                                        border: InputBorder.none,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                          !Provider
                              .of<CouponProvider>(context)
                              .isLoading ? InkWell(
                            onTap: () {
                              if (_controller.text
                                  .isNotEmpty) {
                                Provider.of<CouponProvider>(
                                    context, listen: false).initCoupon(
                                    _controller.text, _order).then((value) {
                                  if (value > 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content:
                                        Text('You got ${PriceConverter
                                            .convertPrice(
                                            context, value)} discount'),
                                            backgroundColor: Colors.green));
                                  } else {
                                    _controller.clear();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(getTranslated(
                                              'invalid_coupon_or', context)!),
                                          backgroundColor: Colors.red,
                                        ));
                                  }
                                });
                              }
                            },
                            child: Container(width: 100, height: 60,
                                decoration: BoxDecoration(
                                    color: Theme
                                        .of(context)
                                        .primaryColor,
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(
                                            Dimensions
                                                .PADDING_SIZE_EXTRA_SMALL),
                                        topRight: Radius.circular(
                                            Dimensions
                                                .PADDING_SIZE_EXTRA_SMALL))

                                ),
                                child: Center(
                                    child: Text(getTranslated('APPLY', context)!,
                                      style: titleRegular.copyWith(color: Theme
                                          .of(context)
                                          .cardColor,
                                          fontSize: Dimensions.FONT_SIZE_LARGE),
                                    ))),
                          ) : CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Theme
                                  .of(context)
                                  .primaryColor)),
                        ]),
                      ),
                    ),
                  ),

//vouchar
                  Visibility(
                    visible: subscriptionIndex == 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: Dimensions.PADDING_SIZE_DEFAULT,
                          right: Dimensions.PADDING_SIZE_DEFAULT,
                          bottom: Dimensions.PADDING_SIZE_DEFAULT),
                      child: Container(height: 50,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                            color: ColorResources.couponColor(context)
                                .withOpacity(.5),
                            borderRadius: BorderRadius.circular(
                                Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            border: Border.all(width: .5, color: Theme
                                .of(context)
                                .primaryColor
                                .withOpacity(.9))
                        ),
                        child: Row(children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: Dimensions.PADDING_SIZE_SMALL,
                                    bottom: 5),
                                child: Center(
                                  child: TextField(
                                      controller: _voucharcontroller,
                                      decoration: InputDecoration(
                                        hintText:getTranslated('have_a_voucher', context),
                                        hintStyle: titilliumRegular.copyWith(
                                            fontSize: Dimensions
                                                .FONT_SIZE_DEFAULT),
                                        filled: false,
                                        fillColor: ColorResources.getIconBg(
                                            context),
                                        border: InputBorder.none,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                          !Provider
                              .of<CouponProvider>(context)
                              .isLoading ? InkWell(
                            onTap: () {
                              if (_voucharcontroller.text.isNotEmpty) {
                                Provider.of<CouponProvider>(
                                    context, listen: false).initVouchars(
                                    _voucharcontroller.text, _order).then((
                                    value) {
                                  if (value > 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content:
                                        Text('You got ${PriceConverter
                                            .convertPrice(
                                            context, value)} discount'),
                                            backgroundColor: Colors.green));
                                  } else {
                                    _voucharcontroller.clear();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(getTranslated(
                                              'invalid_coupon_or', context)!),
                                          backgroundColor: Colors.red,
                                        ));
                                  }
                                });
                              }
                            },
                            child: Container(width: 100, height: 60,
                                decoration: BoxDecoration(
                                    color: Theme
                                        .of(context)
                                        .primaryColor,
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(
                                            Dimensions
                                                .PADDING_SIZE_EXTRA_SMALL),
                                        topRight: Radius.circular(
                                            Dimensions
                                                .PADDING_SIZE_EXTRA_SMALL))

                                ),
                                child: Center(
                                    child: Text(getTranslated('APPLY', context)!,
                                      style: titleRegular.copyWith(color: Theme
                                          .of(context)
                                          .cardColor,
                                          fontSize: Dimensions.FONT_SIZE_LARGE),
                                    ))),
                          ) : CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Theme
                                  .of(context)
                                  .primaryColor)),
                        ]),
                      ),
                    ),
                  ),
                  Consumer<SplashProvider>(
                      builder: (context, profile, _) {
                        return Center(child: Text(
                           " ${getTranslated('available_wallet_balance', context)}${profile.myCurrency!
                                .symbol} ${balanceWallet}"));
                      }
                  )
                  ,
                  const SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
                  Visibility(
                    visible: true,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: Dimensions.PADDING_SIZE_DEFAULT,
                          right: Dimensions.PADDING_SIZE_DEFAULT,
                          bottom: Dimensions.PADDING_SIZE_DEFAULT),
                      child: Container(height: 50,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                            color: ColorResources.couponColor(context)
                                .withOpacity(.5),
                            borderRadius: BorderRadius.circular(
                                Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            border: Border.all(width: .5, color: Theme
                                .of(context)
                                .primaryColor
                                .withOpacity(.9))
                        ),
                        child: Row(children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: Dimensions.PADDING_SIZE_SMALL,
                                    bottom: 5),
                                child: Center(
                                  child: TextField(
                                      controller: _walletcontroller,
                                      decoration: InputDecoration(
                                        hintText:getTranslated('enter_wallet_amount', context),
                                        hintStyle: titilliumRegular.copyWith(
                                            fontSize: Dimensions
                                                .FONT_SIZE_DEFAULT),
                                        filled: false,
                                        fillColor: ColorResources.getIconBg(
                                            context),
                                        border: InputBorder.none,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                          // !Provider.of<CouponProvider>(context).isLoading ?
                          Consumer<ProfileProvider>(
                              builder: (context, profile, _) {
                                return InkWell(
                                  onTap: () async {
                                    if (_walletcontroller.text.isNotEmpty) {
                                      // await Provider.of<ProfileProvider>(context,listen: false).getUserWalletBalance(context);

                                      profile.getUserWalletBalance(context)
                                          .then((value) {
                                        print("object$_order");

                                        if (double.parse(
                                            _walletcontroller.text) < value! &&
                                            double.parse(
                                                _walletcontroller.text) <
                                                _order) {
                                          Provider
                                              .of<CouponProvider>(
                                              context, listen: false)
                                              .sewallet = double.parse(
                                              _walletcontroller.text);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                              SnackBar(content:
                                              Text('You got ${PriceConverter
                                                  .convertPrice(
                                                  context, double.parse(
                                                  _walletcontroller
                                                      .text))} discount'),
                                                  backgroundColor: Colors
                                                      .green));
                                        } else {
                                          _walletcontroller.clear();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Amount should be lesser than the wallet amount',),
                                                backgroundColor: Colors.red,
                                              ));
                                        }
                                      });
                                    }
                                  },
                                  child: Container(width: 100, height: 60,
                                      decoration: BoxDecoration(
                                          color: Theme
                                              .of(context)
                                              .primaryColor,
                                          borderRadius: const BorderRadius.only(
                                              bottomRight: Radius.circular(
                                                  Dimensions
                                                      .PADDING_SIZE_EXTRA_SMALL),
                                              topRight: Radius.circular(
                                                  Dimensions
                                                      .PADDING_SIZE_EXTRA_SMALL))

                                      ),
                                      child: Center(
                                          child: Text(
                                            getTranslated('APPLY', context)!,
                                            style: titleRegular.copyWith(
                                                color: Theme
                                                    .of(context)
                                                    .cardColor,
                                                fontSize: Dimensions
                                                    .FONT_SIZE_LARGE),
                                          ))),
                                );
                              }
                          )

                          // : CircularProgressIndicator(
                          // valueColor: AlwaysStoppedAnimation<Color>(Theme
                          //     .of(context)
                          //     .primaryColor)
                          //     ),
                        ]),
                      ),
                    ),
                  ),


                  const SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                  Container(
                    height: 40, width: MediaQuery
                      .of(context)
                      .size
                      .width,
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .primaryColor
                          .withOpacity(.055),
                    ),
                    child: Center(
                        child: Text(getTranslated('order_summary', context)!,
                          style: titilliumSemiBold.copyWith(
                              fontSize: Dimensions.FONT_SIZE_LARGE),)),
                  ),
                  // Total bill
                  Container(
                    margin: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                    padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    color: Theme
                        .of(context)
                        .highlightColor,
                    child: Consumer<OrderProvider>(
                      builder: (context, order, child) {
                        double _couponDiscount = Provider
                            .of<CouponProvider>(context)
                            .discount! != null ?
                        Provider
                            .of<CouponProvider>(context)
                            .discount! : 0;
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AmountWidget(title: getTranslated(
                                  'sub_total', context), amount: PriceConverter
                                  .convertPrice(context, _order)),
                              AmountWidget(title: getTranslated(
                                  'SHIPPING_FEE', context),
                                  amount: PriceConverter.convertPrice(
                                      context, widget.shippingFee)),
                              AmountWidget1(title:
                              getTranslated(
                                  'wallet_amount', context), amount: PriceConverter
                                  .convertPrice(context, Provider
                                  .of<CouponProvider>(
                                  context, listen: false)
                                  .walletDiscount),onTap: () {
                                Provider
                                    .of<CouponProvider>(
                                    context, listen: false)
                                    .sewallet = 0.0;
                              }),
                              AmountWidget1(title: getTranslated(
                                  'coupon_voucher', context),
                                amount: PriceConverter.convertPrice(
                                    context, _couponDiscount), onTap: () {
                                  Provider
                                      .of<CouponProvider>(
                                      context, listen: false)
                                      .setDiscount = 0.0;
                                },),
                              // AmountWidget(title: getTranslated('TAX', context),
                              //     amount: PriceConverter.convertPrice(
                              //         context, widget.tax)),
                              Divider(height: 5, color: Theme
                                  .of(context)
                                  .hintColor),
                              AmountWidget(title: getTranslated(
                                  'TOTAL_PAYABLE', context),
                                  amount: PriceConverter.convertPrice(context,
                                      (_order + widget.shippingFee! -
                                          Provider
                                              .of<CouponProvider>(
                                              context, listen: false)
                                              .walletDiscount - _couponDiscount +
                                          widget.tax!))),
                            ]);
                      },
                    ),
                  ),

                  // Payment Method
                  // Container(
                  //
                  //   height: 100,
                  //   margin: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                  //   padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  //   color: Theme
                  //       .of(context)
                  //       .highlightColor,
                  //   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(getTranslated('payment_method', context)!,
                  //           style: titilliumSemiBold.copyWith(
                  //               fontSize: Dimensions.FONT_SIZE_LARGE),),
                  //         const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  //         Expanded(child: Row(children: [
                  //           _cod! && !widget.onlyDigital!
                  //               ? Expanded(child: CustomCheckBox(
                  //               title: getTranslated(
                  //                   'cash_on_delivery', context), index: 0))
                  //               : const SizedBox(),
                  //           _digitalPayment! ? Expanded(
                  //             child: Container(
                  //                 child: CustomCheckBox(title: getTranslated(
                  //                     'digital_payment', context),
                  //                     index: !_cod! || widget.onlyDigital!
                  //                         ? 0
                  //                         : 1)),
                  //           ) : const SizedBox(),
                  //         ],)),
                  //       ]),
                  // ),


                  Container(
                    margin: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                    padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    color: Theme
                        .of(context)
                        .highlightColor,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${getTranslated('order_note', context)}',
                                style: robotoRegular.copyWith(
                                    fontSize: Dimensions.FONT_SIZE_LARGE),),
                              Text(
                                '${getTranslated('extra_inst', context)}',
                                style: robotoRegular.copyWith(
                                    color: ColorResources.getHint(context)),),
                            ],
                          ),
                          const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          CustomTextField(
                            hintText: getTranslated('enter_note', context),
                            textInputType: TextInputType.multiline,
                            textInputAction: TextInputAction.done,
                            maxLine: 3,
                            focusNode: _orderNoteNode,
                            controller: _orderNoteController,
                          ),
                        ]),
                  ),


                ]),
          ),
        ],
      ),
    );
  }

  void _callback(bool isSuccess, String message, String orderID,
      List<CartModel> carts) async {
    if (isSuccess) {
      // Provider.of<ProductProvider>(context, listen: false).getLatestProductList(1, context, reload: true,);
      if (Provider
          .of<OrderProvider>(context, listen: false)
          .paymentMethodIndex == 0) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const DashBoardScreen()), (
            route) => false);
        showAnimatedDialog(context, MyDialog(
          icon: Icons.check,
          title: getTranslated('Order_placed', context),
          description: getTranslated('your_order_placed', context),
          isFailed: false,
        ), dismissible: false, isFlip: true);
      } else {

      }
      Provider.of<OrderProvider>(context, listen: false).stopLoader();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message), backgroundColor: ColorResources.red));
    }
  }
}

class PaymentButton extends StatelessWidget {
  final String? image;
  final GestureTapCallback onTap;

  PaymentButton({@required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        margin: const EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: ColorResources.getGrey(context)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(image!),
      ),
    );
  }
}

