import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/rating_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/product_details_screen.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/response/combo_product_datamodel.dart';

class ComboProductCartWidget extends StatelessWidget {
  final ComboProductDataModel productModel;
  const ComboProductCartWidget({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String ratting = productModel.rating != null && productModel.rating!.isNotEmpty? productModel.rating![0].average! : "0";

    return InkWell(
      onTap: () {
        Navigator.push(context, PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (context, anim1, anim2) => ProductDetails(productId: productModel.id,slug: productModel.slug),
        ));
      },
      child: Container(
        height:100,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).highlightColor,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5)],
        ),
        child: Stack(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            // Product Image
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: ColorResources.getIconBg(context),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: FadeInImage.assetNetwork(
                  placeholder: Images.placeholder, fit: BoxFit.fill,
                  height: 70,
                  image: '${Provider.of<SplashProvider>(context, listen: false).baseUrls!.productThumbnailUrl}/${productModel.thumbnail}',
                  imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_1x1,
                      fit: BoxFit.cover,height: 70),
                ),
              ),
            ),

            // Product Details
            Padding(
              padding: const EdgeInsets.only(top :Dimensions.paddingSizeSmall,bottom: 5, left: 5,right: 5),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(productModel.name ?? '', textAlign: TextAlign.center,
                        style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,
                            fontWeight: FontWeight.w400), maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                    const Text("Qty:1")




                  ],
                ),
              ),
            ),
          ]),

          // Off



        ]),
      ),
    );
  }
}
