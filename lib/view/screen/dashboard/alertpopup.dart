import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:provider/provider.dart';

import '../../../localization/language_constrants.dart';
import '../../../provider/brand_provider.dart';
import '../../../provider/category_provider.dart';
import '../../../provider/featured_deal_provider.dart';
import '../../../provider/home_category_product_provider.dart';
import '../../../provider/localization_provider.dart';
import '../../../provider/product_provider.dart';
import '../../../provider/splash_provider.dart';
import '../../../provider/top_seller_provider.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/custom_themes.dart';
import '../../../utill/dimensions.dart';

void languageDialogue(BuildContext context, bool isCurrency) {
  int? index;
  if (isCurrency) {
    index = Provider.of<SplashProvider>(context, listen: false).currencyIndex;
  } else {
    index =
        Provider.of<LocalizationProvider>(context, listen: false).languageIndex;
  }

  List<String?> valueList = [];
  if (isCurrency) {
    for (var currency in Provider.of<SplashProvider>(context, listen: false)
        .configModel!
        .currencyList!) {
      if (currency.status == 1) {
        valueList.add(currency.name);
      }
    }
  } else {
    for (var language in AppConstants.languages) {
      valueList.add(language.languageName);
    }
  }
  AlertDialogue5().show(context,
      showCancelButton: true,
      msg: "ttttvghcv",
      fullScreenWidget: [
        Consumer<SplashProvider>(
          builder: (context, cart, child) {
            return    Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: ColorResources.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(
                                  Dimensions.paddingSizeDefault),
                              child: Text(
                                  isCurrency
                                      ? getTranslated('currency', context)!
                                      : getTranslated('language', context)!,
                                  style: titilliumSemiBold.copyWith(
                                      fontSize: Dimensions.fontSizeLarge)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: valueList.map((value) {
                                return InkWell(
                                  onTap: () async {
                                    Provider.of<SplashProvider>(context, listen: false).initConfig(context);
                                    if (isCurrency) {
                                      Provider.of<SplashProvider>(context, listen: false).setCurrency(index!);
                                      print("Animesh2");
                                      Navigator.pop(context);
                                      Phoenix.rebirth(context);
                                    } else {
                                      if (valueList.indexOf(value) == 2) {
                                        Provider.of<SplashProvider>(context, listen: false).initConfig(context);
                                        var data = await Devicelocale.currentLocale;
                                        List systemList = data!.split("-").toList();
                                        Provider.of<LocalizationProvider>(context, listen: false).setLangaugeSystemDefault(true);
                                        Provider.of<LocalizationProvider>(context, listen: false).setLanguage(Locale(systemList[0].toString(), systemList[1].toString(),));
                                        print("Animesh1dgsgsdg");
                                        Navigator.pop(context);
                                        Phoenix.rebirth(context);
                                        print("Animesh1");
                                      } else {
                                        Provider.of<SplashProvider>(context, listen: false).initConfig(context);
                                        Provider.of<LocalizationProvider>(context, listen: false).setLangaugeSystemDefault(false);
                                        Provider.of<LocalizationProvider>(context, listen: false).setLanguage(Locale(
                                          AppConstants.languages[valueList.indexOf(value)].languageCode!,
                                          AppConstants.languages[valueList.indexOf(value)].countryCode,
                                        ));
                                        print("Animesh2safafsaf${valueList.indexOf(value)}");
                                        Navigator.pop(context);
                                        Phoenix.rebirth(context);
                                        print("Animesh0");
                                      };
                                      Provider.of<CategoryProvider>(context, listen: false).getCategoryList(true);
                                      Provider.of<HomeCategoryProductProvider>(context, listen: false).getHomeCategoryProductList(true);
                                      Provider.of<TopSellerProvider>(context, listen: false).getTopSellerList(true);
                                      Provider.of<BrandProvider>(context, listen: false).getBrandList(true);
                                      Provider.of<ProductProvider>(context, listen: false).getLatestProductList(1, reload: true);
                                      Provider.of<ProductProvider>(context, listen: false).getFeaturedProductList('1', reload: true);
                                      Provider.of<FeaturedDealProvider>(context, listen: false).getFeaturedDealList(true);
                                      Provider.of<ProductProvider>(context, listen: false).getLProductList('1', reload: true);
                                      Provider.of<SplashProvider>(context, listen: false).initConfig(context);
                                    }
                                    // Navigator.pop(context);
                                  },
                                  child: Center(
                                      child: Column(
                                        children: [
                                          const Divider(
                                            color: ColorResources.grey,
                                          ),
                                          Text(value!,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .color)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      )),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 354,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your on pressed event here
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            );
          },
        ),

      ]);
}

class AlertDialogue5 {
  show(
    context, {
    String? alert,
    String? msg,
    String? firstButtonName,
    Function? firstButtonPressEvent,
    String? secondButtonName,
    Function? secondButtonPressEvent,
    bool? showCancelButton,
    bool? showOkButton,
    bool? disableDuration,
    bool? checkIcon,
    bool? hideIcon,
    bool? centerTitle,
    Widget? newWidget,
    List<Widget>? fullScreenWidget,
    String? title,
    String? subTitle,
    EdgeInsets? innerPadding,
  }) {
    var canPressOk = true;
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      showGeneralDialog(
          transitionBuilder: (context, a1, a2, widget) {
            return StatefulBuilder(builder: (context, setState) {
              return Transform.scale(
                scale: a1.value,
                child: Opacity(
                  opacity: a1.value,
                  child: WillPopScope(
                    onWillPop: () {
                      Navigator.pop(context);
                      return Future.value(false);
                    },
                    child: SafeArea(
                      child: Material(
                        color: Colors.transparent,
                        child: TabResponsive().wrapInTab(
                          context: context,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: (fullScreenWidget != null)
                                ? Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Padding(
                                        padding: innerPadding ??
                                            const EdgeInsets.all(8.0),
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Visibility(
                                              visible: title != null,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          title.toString(),
                                                        ),
                                                        Visibility(
                                                            visible: subTitle !=
                                                                null,
                                                            child: Text(
                                                              subTitle
                                                                  .toString(),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        if (canPressOk) {
                                                          canPressOk = false;
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      },
                                                      icon: const Icon(
                                                        Icons.highlight_remove,
                                                        color: Colors.red,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            ListView(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              children: fullScreenWidget,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : TabResponsive().wrapInTab(
                                    context: context,
                                    child: newWidget == null
                                        ? Container(
                                            height: double.infinity,
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            child: ListView(
                                              shrinkWrap: true,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          40, 20, 40, 20),
                                                  child: Container(
                                                      decoration: const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                              decoration:
                                                                  const BoxDecoration(
                                                                      color: ColorResources
                                                                          .primaryMaterial,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(10),
                                                                        topRight:
                                                                            Radius.circular(10),
                                                                      )),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Row(
                                                                  children: [
                                                                    Visibility(
                                                                      visible:
                                                                          !(hideIcon ??
                                                                              false),
                                                                      child:
                                                                          Icon(
                                                                        checkIcon ??
                                                                                false
                                                                            ? Icons.check
                                                                            : Icons.info_outline,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        alert
                                                                            .toString(),
                                                                        textAlign: (centerTitle ??
                                                                                false)
                                                                            ? TextAlign.center
                                                                            : TextAlign.start,
                                                                        style: const TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 15),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .fromLTRB(0,
                                                                    10, 0, 10),
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Text(
                                                                    msg.toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                    8,
                                                                    0,
                                                                    8,
                                                                    0,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Visibility(
                                                                        visible:
                                                                            showCancelButton ??
                                                                                false,
                                                                        child:
                                                                            TextButton(
                                                                          style:
                                                                              TextButton.styleFrom(
                                                                            foregroundColor:
                                                                                Colors.black,
                                                                            padding:
                                                                                const EdgeInsets.all(8),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            if (canPressOk) {
                                                                              canPressOk = false;
                                                                              Navigator.pop(context);
                                                                            }
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            'Cancel',
                                                                            style:
                                                                                TextStyle(color: ColorResources.primaryMaterial, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Visibility(
                                                                        visible:
                                                                            secondButtonName !=
                                                                                null,
                                                                        child:
                                                                            TextButton(
                                                                          style:
                                                                              TextButton.styleFrom(
                                                                            foregroundColor:
                                                                                Colors.black,
                                                                            padding:
                                                                                const EdgeInsets.all(8),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            if (canPressOk) {
                                                                              canPressOk = false;
                                                                              secondButtonPressEvent!();
                                                                            }
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            secondButtonName.toString(),
                                                                            style:
                                                                                const TextStyle(color: ColorResources.primaryMaterial, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Visibility(
                                                                        visible:
                                                                            firstButtonName !=
                                                                                null,
                                                                        child:
                                                                            TextButton(
                                                                          style:
                                                                              TextButton.styleFrom(
                                                                            foregroundColor:
                                                                                Colors.black,
                                                                            padding:
                                                                                const EdgeInsets.all(8),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            if (canPressOk) {
                                                                              canPressOk = false;
                                                                              firstButtonPressEvent!();
                                                                            }
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            firstButtonName.toString(),
                                                                            style:
                                                                                const TextStyle(color: ColorResources.primaryMaterial, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Visibility(
                                                                        visible:
                                                                            showOkButton ??
                                                                                true,
                                                                        child:
                                                                            TextButton(
                                                                          style:
                                                                              TextButton.styleFrom(
                                                                            foregroundColor:
                                                                                Colors.black,
                                                                            padding:
                                                                                const EdgeInsets.all(8),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            if (canPressOk) {
                                                                              canPressOk = false;
                                                                              Navigator.pop(context);
                                                                            }
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            'Ok',
                                                                            style:
                                                                                TextStyle(color: ColorResources.primaryMaterial, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: ColorResources
                                                    .primaryMaterial,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                border: Border.all(
                                                    color:
                                                        ColorResources.grey)),
                                            child: newWidget,
                                          ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
          },
          transitionDuration: const Duration(milliseconds: 200),
          barrierDismissible: true,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation1, animation2) {
            return Container();
          }).then((val) {
        canPressOk = false;
      });
    });
  }
}

class TabResponsive {
  wrapInTab(
      {required BuildContext context, required Widget child, bool? expanded}) {
    return MediaQuery.of(context).size.width > 600
        ? ((expanded ?? true)
            ? Center(
                child: SizedBox(width: 600, child: child),
              )
            : SizedBox(width: 600, child: child))
        : child;
  }

  bool isTab(context) {
    return MediaQuery.of(context).size.width > 600;
  }
}
