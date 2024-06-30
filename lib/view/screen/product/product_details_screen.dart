import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/helper/product_type.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/rating_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/products_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/combo_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/promise_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/seller_view.dart';

import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_details_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/wishlist_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/title_row.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/bottom_cart_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/product_image_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/product_specification_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/product_title_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/related_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/review_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/widget/youtube_video_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';

import 'faq_and_review_screen.dart';

class ProductDetails extends StatefulWidget {
  final int? productId;
  final String? slug;
  final bool isFromWishList;
  const ProductDetails({Key? key, required this.productId, required this.slug, this.isFromWishList = false}) : super(key: key);



  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  _loadData( BuildContext context) async{
    print("Check3"+widget.slug.toString());
    Provider.of<ProductDetailsProvider>(context, listen: false).getProductDetails(context, widget.slug.toString());
    Provider.of<ProductDetailsProvider>(context, listen: false).removePrevReview();
    Provider.of<ProductDetailsProvider>(context, listen: false).initProduct(widget.productId, widget.slug, context);
    Provider.of<ProductProvider>(context, listen: false).removePrevRelatedProduct();
    Provider.of<ProductProvider>(context, listen: false).initRelatedProductList(widget.productId.toString(), context);
    Provider.of<ProductDetailsProvider>(context, listen: false).getCount(widget.productId.toString(), context);
    Provider.of<ProductDetailsProvider>(context, listen: false).getSharableLink(widget.slug.toString(), context);
    if(Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
      Provider.of<WishListProvider>(context, listen: false).checkWishList(widget.productId.toString(), context);


    }


    if(Provider.of<ProductDetailsProvider>(context, listen: false).productDetailsModel!.combo==1){
      Provider.of<ProductDetailsProvider>(context, listen: false).getComboProducts(context, widget.productId.toString());
    }





  }


  @override
  void initState() {
    _loadData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();


    return WillPopScope(

      onWillPop: () async{
        if(widget.isFromWishList){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const WishListScreen()));
        }else{
          Navigator.of(context).pop();
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Row(children: [
          InkWell(
            child: Icon(Icons.arrow_back_ios, color: Theme.of(context).cardColor, size: 20),
            onTap: widget.isFromWishList? () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const WishListScreen())):
                () => Navigator.pop(context),),
          const SizedBox(width: Dimensions.PADDING_SIZE_SMALL),


          Text(getTranslated('product_details', context)!,
              style: robotoRegular.copyWith(fontSize: 20,
                  color: Theme.of(context).cardColor)),
        ]),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Provider.of<ThemeProvider>(context).darkTheme ? Colors.black : Theme.of(context).primaryColor,
        ),

        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: ()async{
              _loadData(context);
            },
            child: Consumer<ProductDetailsProvider>(

              builder: (context, details, child) {


                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: !details.isDetails?
                  Column(
                    children: [
                      ProductImageView(productModel: details.productDetailsModel),

                      Container(
                        transform: Matrix4.translationValues(0.0, -25.0, 0.0),
                        padding: const EdgeInsets.only(top: Dimensions.FONT_SIZE_DEFAULT),
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: const BorderRadius.only(topLeft:Radius.circular(Dimensions.PADDING_SIZE_EXTRA_LARGE),
                              topRight:Radius.circular(Dimensions.PADDING_SIZE_EXTRA_LARGE) ),
                        ),
                        child: Column(children: [



                          ProductTitleView(productModel: details.productDetailsModel,
                              averageRatting: details.productDetailsModel!.averageReview != 0?
                              details.productDetailsModel!.averageReview: "0"),



                         details.productDetailsModel!.combo==1? Container(
                            margin: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                    vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                child: TitleRow(title: getTranslated('combo_products', context), isDetailsPage: true),
                              ),
                              const SizedBox(height: 5),
                              const ComboProductView(),

                            ],
                            ),
                          ):Container(),
                          Container(height: 70,
                            margin: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                            child: ProductSpecification(productSpecification: details.productDetailsModel),) ,

                          details.productDetailsModel!.videoUrl != null?
                          YoutubeVideoWidget(url: details.productDetailsModel!.videoUrl):const SizedBox(),

                          // Container(padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT,
                          //     horizontal: Dimensions.FONT_SIZE_DEFAULT),
                          //     decoration: BoxDecoration(
                          //         color: Theme.of(context).cardColor
                          //     ),
                          //     child: PromiseScreen()),

                          // details.productDetailsModel.addedBy == 'seller' ?
                          // SellerView(sellerId: details.productDetailsModel.userId.toString()) : SizedBox.shrink(),



                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                          //   padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                          //   color: Theme.of(context).cardColor,
                          //   child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                          //     Text(getTranslated('customer_reviews', context),
                          //       style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),),
                          //     SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
                          //     Container(width: 230,height: 30,
                          //       decoration: BoxDecoration(color: ColorResources.visitShop(context),
                          //         borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_LARGE),),
                          //
                          //
                          //       child: Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: [
                          //           RatingBar(rating: double.parse(details.productDetailsModel.averageReview.toString()), size: 18,),
                          //           SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                          //           Text('${double.parse(details.productDetailsModel.averageReview.toString()).toStringAsFixed(1)}'+ ' '+ '${getTranslated('out_of_5', context)}'),
                          //         ],
                          //       ),
                          //     ),
                          //
                          //     SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                          //     Text('${getTranslated('total', context)}' + ' '+'${details.reviewList != null ? details.reviewList.length : 0}' +' '+ '${getTranslated('reviews', context)}'),
                          //
                          //     details.reviewList != null ? details.reviewList.length != 0 ? ReviewWidget(reviewModel: details.reviewList[0])
                          //         : SizedBox() : ReviewShimmer(),
                          //     details.reviewList != null ? details.reviewList.length > 1 ? ReviewWidget(reviewModel: details.reviewList[1])
                          //         : SizedBox() : ReviewShimmer(),
                          //     details.reviewList != null ? details.reviewList.length > 2 ? ReviewWidget(reviewModel: details.reviewList[2])
                          //         : SizedBox() : ReviewShimmer(),
                          //
                          //     InkWell(
                          //         onTap: () {
                          //           if(details.reviewList != null)
                          //           {Navigator.push(context, MaterialPageRoute(builder: (_) =>
                          //               ReviewScreen(reviewList: details.reviewList)));}},
                          //         child: details.reviewList != null && details.reviewList.length > 3?
                          //         Text(getTranslated('view_more', context),
                          //           style: titilliumRegular.copyWith(color: Theme.of(context).primaryColor),):SizedBox())
                          //
                          //
                          //
                          //   ]),
                          // ),

                          details.productDetailsModel!.addedBy == 'seller' ?
                          Padding(padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                            child: TitleRow(title: getTranslated('more_from_the_shop', context), isDetailsPage: true),
                          ):const SizedBox(),

                          details.productDetailsModel!.addedBy == 'seller' ?
                          Padding(padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: ProductView(isHomePage: true, productType: ProductType.SELLER_PRODUCT,
                                scrollController: _scrollController, sellerId: details.productDetailsModel!.userId.toString()),):const SizedBox(),

                          Container(
                            margin: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                    vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                child: TitleRow(title: getTranslated('related_products', context), isDetailsPage: true),
                              ),
                              const SizedBox(height: 5),
                              const RelatedProductView(),

                            ],
                            ),
                          ),


                        ],),),
                    ],
                  ):
                  Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height,
                          child: const Center(child: CircularProgressIndicator())),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: Consumer<ProductDetailsProvider>(
            builder: (context, details, child) {
              return BottomCartView(product: details.productDetailsModel,comboCart:details.comboProductList);
            }
        ),
      ),
    );
  }
}

