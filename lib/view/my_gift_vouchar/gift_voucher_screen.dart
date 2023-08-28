import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helper/date_converter.dart';
import '../../../provider/cart_provider.dart';
import '../../../provider/theme_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/custom_themes.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../provider/gift_voucher-provider.dart';
import '../basewidget/show_custom_snakbar.dart';
import '../screen/cart/cart_screen.dart';


class MyGiftVoucherScreen extends StatefulWidget {
  const MyGiftVoucherScreen({key});

  @override
  State<MyGiftVoucherScreen> createState() => _GiftVoucherScreenState();
}

class _GiftVoucherScreenState extends State<MyGiftVoucherScreen> {
  @override
  void initState() {
    get();
    super.initState();
  }

  get() async {
    setState(() async {
      await Provider.of<GiftVoucherProvider>(context, listen: false)
          .getMyGiftVouchar(context);
    });

  }

  route(bool isRoute, String message) async {
    if (isRoute) {
      showCustomSnackBar(message, context, isError: false);
      // Navigator.pop(context);
    } else {
      // Navigator.pop(context);
      showCustomSnackBar(message, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeProvider>(context).darkTheme
            ? Colors.black
            : Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5))),
        // leading: IconButton(icon: Icon(Icons.arrow_back_ios, size: 20,
        //     color: ColorResources.WHITE),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        title: Text('My Gift Vouchers',
            style: titilliumRegular.copyWith(
                fontSize: 20, color: ColorResources.WHITE)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () {
                //  Navigator.push(context, MaterialPageRoute(builder: (_) => GiftVoucherScreen()));
                Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen()));
              },
              icon: Stack(clipBehavior: Clip.none, children: [
                Image.asset(
                  Images.cart_arrow_down_image,
                  height: Dimensions.ICON_SIZE_DEFAULT,
                  width: Dimensions.ICON_SIZE_DEFAULT,
                  color: Colors.white,
                ),
                Positioned(top: -4, right: -4,
                  child: Consumer<CartProvider>(builder: (context, cart, child) {
                    return CircleAvatar(radius: 7, backgroundColor: ColorResources.red,
                      child: Text(cart.cartList.length.toString(),
                          style: titilliumSemiBold.copyWith(color: ColorResources.WHITE, fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                          )),
                    );
                  }),
                ),
              ]),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Consumer<GiftVoucherProvider>(
              builder: (context, locationProvider, _) {
                return Expanded(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    itemCount: locationProvider
                        .myGiftVoucherList
                        .length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                        margin: EdgeInsets.only(
                            bottom: Dimensions.PADDING_SIZE_SMALL),
                        decoration: BoxDecoration(
                          color: ColorResources.getImageBg(context),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorResources.getSellerTxt(
                              context), width: 2),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order date: ${DateConverter
                                  .localDateToIsoStringAMPM(
                                  DateTime.parse(locationProvider
                                      .myGiftVoucherList[index].createdAt!))}',
                                style: titilliumRegular.copyWith(
                                    fontSize: Dimensions.FONT_SIZE_SMALL),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration:BoxDecoration(
                      color:Colors.red,
                      borderRadius:BorderRadius.circular(10.0)
                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(locationProvider
                                        .myGiftVoucherList[index].code

                                        .toString(), style: titilliumSemiBold.copyWith(
                      color: Colors.white)),
                                  ),
                                ),
                              ),


                              Row(children: [
                                Icon(Icons.card_giftcard,
                                    color: ColorResources.getPrimary(context),
                                    size: 20),
                                SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                                Expanded(child: Text(locationProvider
                                    .myGiftVoucherList[index].name
                                    .toString(), style: titilliumSemiBold)),
                                TextButton(onPressed: null,
                                  style: TextButton.styleFrom(
                                    backgroundColor: locationProvider
                                        .myGiftVoucherList[index].status
                                        .toString() == '1' ?
                                    ColorResources.getGreen(context) : Theme
                                        .of(context)
                                        .primaryColor,),

                                  child: Text(
                                    locationProvider
                                        .myGiftVoucherList[index].isPurchase
                                        .toString() == '1' ?
                                    'Redeem' : 'Not Redeem',
                                    style: titilliumSemiBold.copyWith(
                                        color: Colors.white),
                                  ),
                                ),
                              ]),
                            ]),
                      );
                    },
                  ),
                );
              }
    ) // CountrySearchDialog(),
                ]));
  }
}
