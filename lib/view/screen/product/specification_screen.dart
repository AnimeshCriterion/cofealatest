import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';

import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../data/model/response/product_details_model.dart';
import '../../../utill/custom_themes.dart';
import '../../../utill/dimensions.dart';

class SpecificationScreen extends StatelessWidget {
  final ProductDetailsModel specification;
  const SpecificationScreen({Key? key, required this.specification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          CustomAppBar(title: getTranslated('specification', context)),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Visibility(
                  visible: specification.uSp1.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "DIMENSIONS WxDxH MM",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uSp1.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uAc1.toString().isNotEmpty,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Weight (kg)",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uAc1.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:  specification.uSp3.toString().isNotEmpty,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Power (W)",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uSp3.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:  specification.uSp4.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Bean Container Capacity g",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uSp4.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:  specification.uSp5.toString().isNotEmpty,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Water Container Capacity",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uSp5.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:  specification.uSp6.toString().isNotEmpty,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Milk Frother",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uSp6.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:  specification.uAc1.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Coffee tamper",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uAc1.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:  specification.uAc2.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Descaler",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uAc2.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:  specification.uAc3.toString().isNotEmpty,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Cleaning Brush",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uAc3.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:  specification.uAc4.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Measuring Scoop",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uAc4.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:  specification.uAc5.toString().isNotEmpty,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Carbon Active Filter",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uAc5.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:  specification.uAc6.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Milk jug",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uAc6.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:  specification.uF1.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Auto Shut-off",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uF1.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:  specification.uF2.toString().isNotEmpty,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Removable water tank",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uF2.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uF3.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Removable drip tray",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uF3.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uF4.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Water level indicator",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uF3.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uF5.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Compatible for ESE pods",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uF5.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uF6.toString().isNotEmpty,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Pump Pressure bar",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uF6.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uF7.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Sensor Grinding Technology",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uF7.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uF8.toString().isNotEmpty,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Max cup height (mm)inches",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uF8.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uF9.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Grounds container capacity (n)",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uF9.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uF10.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Capacity",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uF10.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uF11.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Material",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uF11.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uNsp1.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Non Electric Specifications",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uNsp1.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:specification.uNpo.toString().isNotEmpty,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Pour over	",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uNpo.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uCfspc.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Sub1",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uCfspc.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uEsp.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Sub2",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uEsp.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uOrg.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Origin",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uOrg.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uBn.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Bean Type	",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uBn.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uRs.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Roast",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uRs.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uPrs.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Process",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uPrs.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uAlt.toString().isNotEmpty,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Altitude",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uAlt.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uCfp.toString().isNotEmpty ,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Coffee Plant	",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uCfp.toString())))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: specification.uCpn.toString().isNotEmpty,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Cupping Notes	",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uCpn.toString())))
                      ],
                    ),
                  ),
                ),
                // Visibility(
                //   visible: specification.uF2.toString().isNotEmpty ,
                //   child: Container(
                //     decoration: BoxDecoration(
                //         border: Border.all(color: Theme.of(context).hintColor)),
                //     child: Row(
                //       children: [
                //         Expanded(
                //             child: Container(
                //                 decoration: BoxDecoration(
                //                   border: Border(
                //                       right: BorderSide(
                //                           color: Theme.of(context).hintColor)),
                //                   color: Theme.of(context).hintColor.withOpacity(0.1),
                //                 ),
                //                 child: Center(
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Text(
                //                         "Weight",
                //                         style: titilliumSemiBold.copyWith(
                //                             fontSize: Dimensions.FONT_SIZE_DEFAULT),
                //                       ),
                //                     )))),
                //         Expanded(child: Center(child: Text("")))
                //       ],
                //     ),
                //   ),
                // ),
                Visibility(
                  visible:specification.uStoragetype.toString().isNotEmpty,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hintColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Theme.of(context).hintColor)),
                                  color: Theme.of(context).hintColor.withOpacity(0.1),
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Storage Type	",
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    )))),
                        Expanded(child: Center(child: Text(specification.uStoragetype.toString())))
                      ],
                    ),
                  ),
                ),






              ],
            ),
          )
        ]),
      ),
    );
  }
}
