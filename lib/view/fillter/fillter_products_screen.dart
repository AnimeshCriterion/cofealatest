import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/main.dart';
import 'package:flutter_sixvalley_ecommerce/provider/fillter_provider.dart';
import 'package:provider/provider.dart';

import '../../localization/language_constrants.dart';
import '../../provider/theme_provider.dart';
import '../../utill/color_resources.dart';
import '../../utill/custom_themes.dart';
import '../screen/category/all_category_screen.dart';
import '../screen/product/brand_and_category_product_screen.dart';

class FillterProductsView extends StatefulWidget {

  final bool isBrand;
  final String id;
  final String? name;
  final String? image;

  const FillterProductsView(
      {Key? key, required this.isBrand, required this.id, required this.name, this.image})
      : super(key: key);
  @override
  State<FillterProductsView> createState() => _FillterProductsViewState();
}

class _FillterProductsViewState extends State<FillterProductsView> {


  @override
  void initState() {

    _loadData(false);

  }

  Future<void> _loadData(bool reload) async {
    await Provider.of<FillterProductsProvider>(Get.context!, listen: false).hitGetFillterBrandsApi(context,id: widget.id);
    await Provider.of<FillterProductsProvider>(Get.context!, listen: false).hitGetFillterIntencityApi(context,id: widget.id);
    await Provider.of<FillterProductsProvider>(Get.context!, listen: false).hitGetFillterProductsOriginApi(context,id: widget.id);
    await Provider.of<FillterProductsProvider>(Get.context!, listen: false).hitGetFillterTypesApi(context,id: widget.id);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getIconBg(context),
        appBar: AppBar(
            leading: InkWell(
              onTap: (){
                Provider.of<FillterProductsProvider>(Get.context!, listen: false).clearAllFillter();
                Provider.of<FillterProductsProvider>(Get.context!, listen: false).updateAllListData();
                Navigator.pop(context);
              },
                child: const Icon(Icons.arrow_back,color: Colors.white,)),
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
          actions: [
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  BrandAndCategoryProductScreen(isBrand: widget.isBrand, id:widget.id, name:widget.name,

                )));
              },

              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Center(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Provider
                            .of<ThemeProvider>(context)
                            .darkTheme
                            ? Theme
                            .of(context)
                            .primaryColor
                            : Colors.black.withOpacity(0.5)
                      ),
                      child:  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(getTranslated('APPLY', context)!,style: TextStyle(color: Colors.white),),
                  )),
                ),
              ),
            ),

            InkWell(
              onTap: (){
                Provider.of<FillterProductsProvider>(Get.context!, listen: false).clearAllFillter();
                Provider.of<FillterProductsProvider>(Get.context!, listen: false).updateAllListData();

              },

              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Center(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Provider
                              .of<ThemeProvider>(context)
                              .darkTheme
                              ? Theme
                              .of(context)
                              .primaryColor
                              : Colors.black.withOpacity(0.5)
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(getTranslated('clear', context)!,style: const TextStyle(color: Colors.white)),
                      )),
                ),
              ),
            ),

          ],
        ),
        body: Row(
          children: [
            Column(
                children: [
                  Expanded(child:
                  Consumer<FillterProductsProvider>(
                    builder: (context, categoryProvider, child) {
                      return categoryProvider.getFillterSideText.isNotEmpty ?
                      Row(children: [

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
                                onTap: () {
                                  Provider.of<FillterProductsProvider>(context, listen: false).changeSelectedIndex(index);
                                },
                                child: CategoryItem(
                                  title: category,
                                  icon:"",
                                  isSelected: categoryProvider.categorySelectedIndex == index,
                                ),
                              );

                            },
                          ),
                        ),

                        loadWidget(categoryProvider.categorySelectedIndex,categoryProvider)



                      ]) : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
                    },
                  )),
                ]
            ),


          ],

        )
    );
  }

  Widget loadWidget(int? categorySelectedIndex, FillterProductsProvider categoryProvider) {


    switch (categorySelectedIndex){
      case 0:
        return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(top: 3),
    height: double.infinity,
    decoration: BoxDecoration(
    color: Theme.of(context).highlightColor,
    boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ? 700 : 200]!,
    spreadRadius: 1, blurRadius: 1)],
    ),
    child: Padding(
    padding: const EdgeInsets.only(right: 18.0),
    child: ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: categoryProvider.getFillterBrands.length,
    itemBuilder: (ctx,index){
    return InkWell(
    onTap: () {

    },
    child: Padding(
    padding:  const EdgeInsets.only(right: 20),
    child: CheckboxListTile(
    tileColor: Colors.red,
    title:  Text("${categoryProvider.getFillterBrands[index].name} (${categoryProvider.getFillterBrands[index].product_count})"),
    value: categoryProvider.getFillterBrands[index].isSelect,
    controlAffinity: ListTileControlAffinity.leading,
    onChanged:(bool? value) {
    if(categoryProvider.getFillterBrands[index].isSelect==true){
      categoryProvider.addSelectedBrands(categoryProvider.getFillterBrands[index].id);
    categoryProvider.updateIsSelectForBrands(false, index);

    }else{
      categoryProvider.addSelectedBrands(categoryProvider.getFillterBrands[index].id);
    categoryProvider.updateIsSelectForBrands(true, index);

    }
    },
    ),
    ),
    );

    }),
    ),
    );
      break;
      case 1:
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 3),
          height: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ? 700 : 200]!,
                spreadRadius: 1, blurRadius: 1)],
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: categoryProvider.getFillterProductsOrigin.length,
                itemBuilder: (ctx,index){
                  return InkWell(
                    onTap: () {
                    },
                    child: Padding(
                      padding:  const EdgeInsets.only(right: 20),
                      child: CheckboxListTile(
                        tileColor: Colors.red,
                        title:  Text("${categoryProvider.getFillterProductsOrigin[index].uOrg} (${categoryProvider.getFillterProductsOrigin[index].productCount})"),
                        value: categoryProvider.getFillterProductsOrigin[index].isSelect,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged:(bool? value) {
                          if(categoryProvider.getFillterProductsOrigin[index].isSelect==true){
                            categoryProvider.addSelectedOrigin(categoryProvider.getFillterProductsOrigin[index].uOrg);
                             categoryProvider.updateIsSelectForOrigin(false, index);
                          }else{
                            categoryProvider.addSelectedOrigin(categoryProvider.getFillterProductsOrigin[index].uOrg);
                            categoryProvider.updateIsSelectForOrigin(true, index);
                          }
                        },
                      ),
                    ),
                  );

                }),
          ),
        );
        break;
      case 2:
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 3),
          height: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ? 700 : 200]!,
                spreadRadius: 1, blurRadius: 1)],
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: categoryProvider.getFillterIntencity.length,
                itemBuilder: (ctx,index){
                  return InkWell(
                    onTap: () {
                    },
                    child: Padding(
                      padding:  const EdgeInsets.only(right: 20),
                      child: CheckboxListTile(
                        tileColor: Colors.red,
                        title:  Text("${categoryProvider.getFillterIntencity[index].uRs} (${categoryProvider.getFillterIntencity[index].productCount})"),
                        value: categoryProvider.getFillterIntencity[index].isSelect,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged:(bool? value) {
                          if(categoryProvider.getFillterIntencity[index].isSelect==true){
                            categoryProvider.addSelectedIntencity(categoryProvider.getFillterIntencity[index].uRs);
                            categoryProvider.updateIsSelectForIntencity(false, index);
                          }else{
                            categoryProvider.addSelectedIntencity(categoryProvider.getFillterIntencity[index].uRs);
                            categoryProvider.updateIsSelectForIntencity(true, index);
                          }
                        },
                      ),
                    ),
                  );

                }),
          ),
        );
      case 3:
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 3),
          height: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ? 700 : 200]!,
                spreadRadius: 1, blurRadius: 1)],
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: categoryProvider.getFillterTypes.length,
                itemBuilder: (ctx,index){
                  return InkWell(
                    onTap: () {
                    },
                    child: Padding(
                      padding:  const EdgeInsets.only(right: 20),
                      child: CheckboxListTile(
                        tileColor: Colors.red,
                        title:  Text("${categoryProvider.getFillterTypes[index].uBn} (${categoryProvider.getFillterTypes[index].productCount})"),
                        value: categoryProvider.getFillterTypes[index].isSelect,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged:(bool? value) {
                          if(categoryProvider.getFillterTypes[index].isSelect==true){
                            categoryProvider.addSelectedTypes(categoryProvider.getFillterTypes[index].uBn);

                            categoryProvider.updateIsSelectForTypes(false, index);
                          }else{
                            categoryProvider.addSelectedTypes(categoryProvider.getFillterTypes[index].uBn);

                            categoryProvider.updateIsSelectForTypes(true, index);
                          }
                        },
                      ),
                    ),
                  );

                }),
          ),
        );

    }

    return Container();

  }

}
