import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/view/giftVoucher/voucharcartDataModel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/cart_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/cart_provider.dart';
import '../../../provider/product_details_provider.dart';
import '../../../provider/profile_provider.dart';
import '../../../provider/splash_provider.dart';
import '../../../provider/theme_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/custom_themes.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../data/model/response/gift_voucher_data_model.dart';
import '../../provider/gift_voucher-provider.dart';
import '../basewidget/show_custom_snakbar.dart';
import '../screen/cart/cart_screen.dart';


class GiftVoucherScreen extends StatefulWidget {
  const GiftVoucherScreen({key});

  @override
  State<GiftVoucherScreen> createState() => _GiftVoucherScreenState();
}

class _GiftVoucherScreenState extends State<GiftVoucherScreen> {
  @override
  void initState() {
    get();
    super.initState();
  }

  get() async {
    await Provider.of<GiftVoucherProvider>(context, listen: false)
        .getVoucherList(context);
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
        title: Text(getTranslated('gift_vouchers', context)!,
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
          // CustomAppBar(title: getTranslated('gifts', context)),
          Expanded(child: Consumer<GiftVoucherProvider>(
            builder: (context, categoryProvider, child) {
              return categoryProvider.giftVoucherList.length != 0
                  ? Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 3),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[
                                    Provider.of<ThemeProvider>(context)
                                            .darkTheme
                                        ? 700
                                        : 200]!,
                                spreadRadius: 1,
                                blurRadius: 1)
                          ],
                        ),
                        child: StaggeredGridView.countBuilder(
                          physics: BouncingScrollPhysics(),
                          itemCount: categoryProvider.giftVoucherList.length,
                          padding: EdgeInsets.all(0),
                          crossAxisCount: 2,
                          // padding: EdgeInsets.all(0),
                          // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          staggeredTileBuilder: (int index) =>
                              StaggeredTile.fit(1),
                          itemBuilder: (context, index) {
                            GiftVoucherDataModel _category =
                                categoryProvider.giftVoucherList[index];
                            return InkWell(
                                onTap: () {
                                  // return Provider.of<GiftVoucherProvider>(context, listen: false).changeSelectedIndex(index);
                                },
                                child: InkWell(
                                  onTap: () {

                                  },
                                  child: Container(
                                    // height: MediaQuery.of(context).size.width/2,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context).highlightColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 5)
                                      ],
                                    ),
                                    child: Stack(children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            // Product Image
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              decoration: BoxDecoration(
                                                color: ColorResources.getIconBg(
                                                    context),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10)),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10)),
                                                child: FadeInImage.assetNetwork(
                                                  placeholder:
                                                      Images.placeholder,
                                                  fit: BoxFit.cover,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  image:
                                                      '${Provider.of<SplashProvider>(context, listen: false).baseUrls!.productThumbnailUrl}/${_category.image}',
                                                  imageErrorBuilder:
                                                      (c, o, s) => Image.asset(
                                                          Images
                                                              .placeholder_1x1,
                                                          fit: BoxFit.cover,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              2.45),
                                                ),
                                              ),
                                            ),

                                            InkWell(
                                              onTap: () {
                                                if (Provider.of<AuthProvider>(context,
                                                    listen: false)
                                                    .isLoggedIn()) {
                                                  VoucharCartModel cart=VoucharCartModel(
                                                      _category.giftVoucherId,
                                                      0,
                                                      _category.giftVoucherId,
                                                      _category.name.toString(),
                                                      "seller",
                                                      "",
                                                      _category.price.toString(),
                                                      _category.price,
                                                      1,
                                                      1,
                                                      "",
                                                      null,
                                                      "",
                                                      0,
                                                      0,
                                                      0,
                                                      0,
                                                      1,
                                                      _category.image.toString(),
                                                      null,
                                                      null,
                                                      null,
                                                      [0],
                                                      0,
                                                      null,
                                                      0,
                                                      _category.slug.toString());

                                                  print("Cart Data" +
                                                      jsonEncode(cart.toJson()));
                                                  // cart.variations = _variation;

                                                  Provider.of<CartProvider>(context,
                                                      listen: false)
                                                      .addVoucharToCartAPI(cart,route, context, [],
                                                      Provider.of<ProductDetailsProvider>(context, listen: false).variationIndex);
                                                  // Navigator.pop(context);
                                                  showCustomSnackBar(
                                                      getTranslated(
                                                          'added_to_cart', context),
                                                      context,
                                                      isError: false);
                                                } else {showCustomSnackBar(
                                                    "Please login first", context,
                                                    isToaster: true);}

                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: Dimensions
                                                        .PADDING_SIZE_SMALL,
                                                    bottom: 5,
                                                    left: 5,
                                                    right: 5),
                                                child: Container(
                                                  child: Center(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: 35,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      5),
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: ColorResources
                                                                .getPrimary(
                                                                    context),
                                                          ),
                                                          child: Text(
                                                            getTranslated(
                                                                'buy_now',
                                                                context)!,
                                                            style: titilliumSemiBold.copyWith(
                                                                fontSize: Dimensions
                                                                    .FONT_SIZE_LARGE,
                                                                color: Theme.of(
                                                                        context)
                                                                    .highlightColor),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),

                                      // Off

                                      // productModel.discount > 0 ?
                                      // Positioned(top: 0, left: 0, child: Container(
                                      //   height: 20,
                                      //   padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                      //   decoration: BoxDecoration(
                                      //     color: ColorResources.getPrimary(context),
                                      //     borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                      //   ),
                                      //
                                      //
                                      //   child: Center(
                                      //     child: Text(PriceConverter.percentageCalculation(context, productModel.unitPrice,
                                      //         productModel.discount, productModel.discountType),
                                      //       style: robotoRegular.copyWith(color: Theme.of(context).highlightColor,
                                      //           fontSize: Dimensions.FONT_SIZE_SMALL),
                                      //     ),
                                      //   ),
                                      // ),
                                      // ) : SizedBox.shrink(),
                                    ]),
                                  ),
                                ));
                          },
                        ),
                      ),

                      // Expanded(child: ListView.builder(
                      //   padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                      //   itemCount: categoryProvider.giftVoucherList[categoryProvider.categorySelectedIndex].subCategories.length+1,
                      //   itemBuilder: (context, index) {
                      //
                      //     SubCategory _subCategory;
                      //     if(index != 0) {
                      //       _subCategory = categoryProvider.categoryList[categoryProvider.categorySelectedIndex].subCategories[index-1];
                      //     }
                      //     if(index == 0) {
                      //       return Ink(
                      //         color: Theme.of(context).highlightColor,
                      //         child: ListTile(
                      //           title: Text(getTranslated('all', context), style: titilliumSemiBold, maxLines: 2, overflow: TextOverflow.ellipsis),
                      //           trailing: Icon(Icons.navigate_next),
                      //           onTap: () {
                      //             Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
                      //               isBrand: false,
                      //               id: categoryProvider.categoryList[categoryProvider.categorySelectedIndex].id.toString(),
                      //               name: categoryProvider.categoryList[categoryProvider.categorySelectedIndex].name,
                      //             )));
                      //           },
                      //         ),
                      //       );
                      //     }else if (_subCategory.subSubCategories.length != 0) {
                      //       return Ink(
                      //         color: Theme.of(context).highlightColor,
                      //         child: Theme(
                      //           data: Provider.of<ThemeProvider>(context).darkTheme ? ThemeData.dark() : ThemeData.light(),
                      //           child: ExpansionTile(
                      //             key: Key('${Provider.of<CategoryProvider>(context).categorySelectedIndex}$index'),
                      //             title: Text(_subCategory.name, style: titilliumSemiBold.copyWith(color: Theme.of(context).textTheme.bodyText1.color), maxLines: 2, overflow: TextOverflow.ellipsis),
                      //             children: _getSubSubCategories(context, _subCategory),
                      //           ),
                      //         ),
                      //       );
                      //     } else {
                      //       return Ink(
                      //         color: Theme.of(context).highlightColor,
                      //         child: ListTile(
                      //           title: Text(_subCategory.name, style: titilliumSemiBold, maxLines: 2, overflow: TextOverflow.ellipsis),
                      //           trailing: Icon(Icons.navigate_next, color: Theme.of(context).textTheme.bodyText1.color),
                      //           onTap: () {
                      //             Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
                      //               isBrand: false,
                      //               id: _subCategory.id.toString(),
                      //               name: _subCategory.name,
                      //             )));
                      //           },
                      //         ),
                      //       );
                      //     }
                      //
                      //   },
                      // )),
                    ])
                  : Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor)));
            },
          )),
        ],
      ),
    );
  }
}
