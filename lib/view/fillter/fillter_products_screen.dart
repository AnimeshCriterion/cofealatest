import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/provider/fillter_provider.dart';
import 'package:provider/provider.dart';

import '../../localization/language_constrants.dart';
import '../../provider/theme_provider.dart';
import '../../utill/color_resources.dart';
import '../../utill/custom_themes.dart';
import '../screen/category/all_category_screen.dart';

class FillterProductsView extends StatefulWidget {
  const FillterProductsView({Key? key}) : super(key: key);

  @override
  State<FillterProductsView> createState() => _FillterProductsViewState();
}

class _FillterProductsViewState extends State<FillterProductsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getIconBg(context),
        appBar: AppBar(
          backgroundColor: Provider
              .of<ThemeProvider>(context)
              .darkTheme
              ? Colors.black
              : Theme
              .of(context)
              .primaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5))),
          // leading: IconButton(icon: Icon(Icons.arrow_back_ios, size: 20,
          //     color: ColorResources.WHITE),
          //   onPressed: () => Navigator.of(context).pop(),
          // ),
          title: Text(getTranslated('fillter_products', context)!,
              style: titilliumRegular.copyWith(
                  fontSize: 20, color: ColorResources.WHITE)),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [
                Expanded(child: Consumer<FillterProductsProvider>(
                  builder: (context, categoryProvider, child) {
                    return categoryProvider.getFillterSideText.isNotEmpty ? Row(children: [

                      Container(
                        width: 100,
                        margin: const EdgeInsets.only(top: 3),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ? 700 : 200]!,
                              spreadRadius: 1, blurRadius: 1)],
                        ),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: categoryProvider.getFillterSideText.length,
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (context, index) {
                            String category = categoryProvider.getFillterSideText[index];
                            return InkWell(
                              onTap: () => Provider.of<FillterProductsProvider>(context, listen: false).changeSelectedIndex(index),
                              child: CategoryItem(
                                title: category,
                                icon:"",
                                isSelected: categoryProvider.categorySelectedIndex == index,
                              ),
                            );

                          },
                        ),
                      ),


                    ]) : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
                  },
                )),
              ]
          ),
        )
    );
  }

}
