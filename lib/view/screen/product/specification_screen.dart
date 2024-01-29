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
                                      getTranslated('dimensions_WxDxH_MM', context)!,
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
                                        getTranslated('weight(kg)', context)!,
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
                                       getTranslated('power(W)', context)!,
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
                                        getTranslated('bean_container_capacity_g', context)!,
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
                                        getTranslated('water_container_capacity', context)!,
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
                                        getTranslated('milk_frother', context)!,
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
                                      getTranslated('coffee_tamper', context)!,
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
                                     getTranslated('descaler', context)!,
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
                                      getTranslated('Cleaning_brush', context)!,
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
                                        getTranslated('measuring_scoop', context)!,
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
                                     getTranslated('carbon_active_filter', context)!,
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
                                         getTranslated('milk_jug', context)!,
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
                                       getTranslated('auto_shut_off', context)!,
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
                                      getTranslated('removable_water_tank', context)!,
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
                                      getTranslated('removable_drip_tray', context)!,
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
                                       getTranslated('water_level_indicator', context)!,
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
                                        getTranslated('sompatible_for_ESE_pods', context)!,
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
                                      getTranslated('pump_pressure_bar', context)!,
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
                                        getTranslated('sensor_grinding_technology', context)!,
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
                                        getTranslated('max_cup_height_(mm)inches', context)!,
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
                                      getTranslated('grounds_container_capacity_(n)', context)!,
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
                                        getTranslated('capacity', context)!,
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
                                       getTranslated('material', context)!,
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
                                     getTranslated('non_electric_specifications', context)!,
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
                                         getTranslated('pour_over', context)!,
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
                                       getTranslated('sub1', context)!,
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
                                     getTranslated('sub2', context)!,
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
                                         getTranslated('origin', context)!,
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
                                     getTranslated('bean_type', context)!,
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
                                       getTranslated('roast', context)!,
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
                                        getTranslated('process', context)!,
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
                                        getTranslated('altitude', context)!,
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
                                        getTranslated('coffee_plant', context)!,
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
                // Visibility(
                //   visible:specification.uStoragetype.toString().isNotEmpty,
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
                //                         "Storage type",
                //                         style: titilliumSemiBold.copyWith(
                //                             fontSize: Dimensions.FONT_SIZE_DEFAULT),
                //                       ),
                //                     )))),
                //         Expanded(child: Center(child: Text(specification.uStoragetype.toString())))
                //       ],
                //     ),
                //   ),
                // ),






              ],
            ),
          )
        ]),
      ),
    );
  }
}
