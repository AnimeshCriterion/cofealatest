import 'package:flutter/material.dart';

import 'package:flutter_sixvalley_ecommerce/helper/product_type.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/main.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/banner_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/brand_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/category_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/featured_deal_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/flash_deal_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/home_category_product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/top_seller_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/title_row.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/brand/all_brand_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/cart/cart_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/category/all_category_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/featureddeal/featured_deal_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/announcement.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/banners_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/brand_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/category_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/featured_deal_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/featured_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/flash_deals_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/footer_banner.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/home_category_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/latest_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/main_section_banner.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/products_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/flashdeal/flash_deal_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/recommended_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/top_seller_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/view_all_product_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/search/search_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/topSeller/all_top_seller_screen.dart';
import 'package:ottu/ottu.dart';
import 'package:ottu/paymentDelegate/paymentDelegate.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';

import '../../../provider/fillter_provider.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  {
  final ScrollController _scrollController = ScrollController();




  Future<void> _loadData(bool reload) async {
    await Provider.of<BannerProvider>(Get.context!, listen: false).getBannerList(reload);
    await Provider.of<BannerProvider>(Get.context!, listen: false).getFooterBannerList();
    await Provider.of<BannerProvider>(Get.context!, listen: false).getMainSectionBanner();
    await Provider.of<CategoryProvider>(Get.context!, listen: false).getCategoryList(reload);
    await Provider.of<HomeCategoryProductProvider>(Get.context!, listen: false).getHomeCategoryProductList(reload);
    await Provider.of<TopSellerProvider>(Get.context!, listen: false).getTopSellerList(reload);
    await Provider.of<BrandProvider>(Get.context!, listen: false).getBrandList(reload);
    await Provider.of<ProductProvider>(Get.context!, listen: false).getLatestProductList(1, reload: reload);
    await Provider.of<ProductProvider>(Get.context!, listen: false).getFeaturedProductList('1', reload: reload);
    await Provider.of<FeaturedDealProvider>(Get.context!, listen: false).getFeaturedDealList(reload);
    await Provider.of<ProductProvider>(Get.context!, listen: false).getLProductList('1', reload: reload);
    await Provider.of<ProductProvider>(Get.context!, listen: false).getRecommendedProduct();
  }

  void passData(int index, String title) {
    index = index;
    title = title;
  }

  bool singleVendor = false;
  @override
  void initState() {
    super.initState();
    singleVendor = Provider.of<SplashProvider>(context, listen: false).configModel!.businessMode == "single";
    Provider.of<FlashDealProvider>(context, listen: false).getMegaDealList(true, true);

    _loadData(false);

    if(Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
      Provider.of<CartProvider>(context, listen: false).uploadToServer(context);
      Provider.of<CartProvider>(context, listen: false).getCartDataAPI(context);
    }else {
      Provider.of<CartProvider>(context, listen: false).getCartData();
    }
  }


  @override
  Widget build(BuildContext context) {

    Provider.of<FillterProductsProvider>(Get.context!, listen: false).clearAllFillter();
    Provider.of<FillterProductsProvider>(Get.context!, listen: false).updateAllListData();
   List<String?> types =[getTranslated('new_arrival', context),getTranslated('top_product', context), getTranslated('best_selling', context),  getTranslated('discounted_product', context)];
    return UpgradeAlert(
      upgrader: Upgrader(),
      child: Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: RefreshIndicator(
            backgroundColor: Theme.of(context).cardColor,
            onRefresh: () async {
              await _loadData(true);
              await Provider.of<FlashDealProvider>(context, listen: false).getMegaDealList(true,  false);
            },
            child: Stack(
              children: [
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    // App Bar
                    SliverAppBar(
                      floating: true,
                      elevation: 0,
                      centerTitle: false,
                      automaticallyImplyLeading: false,
                      backgroundColor: Theme.of(context).highlightColor,
                      title: Image.asset(Images.logo_with_name_image, height: 35),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: IconButton(
                            onPressed: () {
                              //  Navigator.push(context, MaterialPageRoute(builder: (_) => GiftVoucherScreen()));
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
                            },
                            icon: Stack(clipBehavior: Clip.none, children: [
                              Image.asset(
                                Images.cart_arrow_down_image,
                                height: Dimensions.ICON_SIZE_DEFAULT,
                                width: Dimensions.ICON_SIZE_DEFAULT,
                                color: ColorResources.getPrimary(context),
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

                    // Search Button
                    SliverPersistentHeader(
                        pinned: true,
                        delegate: SliverDelegate(
                            child: InkWell(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchScreen())),
                              child: Container(padding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.HOME_PAGE_PADDING, vertical: Dimensions.PADDING_SIZE_SMALL),
                                color: ColorResources.getHomeBg(context),
                                alignment: Alignment.center,
                                child: Container(padding: const EdgeInsets.only(
                                  left: Dimensions.HOME_PAGE_PADDING, right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                  top: Dimensions.PADDING_SIZE_EXTRA_SMALL, bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                ),
                                  height: 60, alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(color: Theme.of(context).cardColor,
                                    boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ?
                                    900 : 200]!, spreadRadius: 1, blurRadius: 1)],
                                    borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),),
                                  child: Row(mainAxisAlignment : MainAxisAlignment.spaceBetween, children: [

                                    Text(getTranslated('SEARCH_HINT', context)!,
                                        style: robotoRegular.copyWith(color: Theme.of(context).hintColor)),

                                    Container(
                                      width: 40,height: 40,decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                                        borderRadius: const BorderRadius.all(Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL))
                                    ),
                                      child: Icon(Icons.search, color: Theme.of(context).cardColor, size: Dimensions.ICON_SIZE_SMALL),
                                    ),
                                  ]),
                                ),
                              ),
                            ))),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(Dimensions.HOME_PAGE_PADDING,
                            Dimensions.PADDING_SIZE_SMALL, Dimensions.PADDING_SIZE_DEFAULT, Dimensions.PADDING_SIZE_SMALL  ),
                        child: Column(
                          children: [
                            const BannersView(),
                            const SizedBox(height: Dimensions.HOME_PAGE_PADDING),



                            // Category
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              child: TitleRow(title: getTranslated('CATEGORY', context),
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AllCategoryScreen()))),
                            ),
                            const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            const Padding(
                              padding: EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                              child: CategoryView(isHomePage: true),
                            ),





                            // Mega Deal
                            Consumer<FlashDealProvider>(
                              builder: (context, flashDeal, child) {
                                return  (flashDeal.flashDeal != null
                                    && flashDeal.flashDealList.isNotEmpty)
                                    ? TitleRow(title: getTranslated('flash_deal', context),
                                  eventDuration: flashDeal.flashDeal != null ? flashDeal.duration : null,
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => const FlashDealScreen()));
                                  },isFlash: true,
                                )
                                    : const SizedBox.shrink();
                              },
                            ),
                            const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            Consumer<FlashDealProvider>(
                              builder: (context, megaDeal, child) {
                                return  (megaDeal.flashDeal != null && megaDeal.flashDealList.isNotEmpty)
                                    ? Container(height: MediaQuery.of(context).size.width*.77,
                                    child: const Padding(
                                      padding: EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                                      child: FlashDealsView(),
                                    )) : const SizedBox.shrink();},),





                            // Brand
                            Provider.of<SplashProvider>(context, listen: false).configModel!.brandSetting == "1"?
                            Padding(
                              padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL, right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                  bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              child: TitleRow(title: getTranslated('brand', context),
                                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => const AllBrandScreen()));}),
                            ):const SizedBox(),
                            SizedBox(height: Provider.of<SplashProvider>(context, listen: false).configModel!.brandSetting == "1"?Dimensions.PADDING_SIZE_SMALL: 0),
                            Provider.of<SplashProvider>(context, listen: false).configModel!.brandSetting == "1"?
                            const BrandView(isHomePage: true) : const SizedBox(),



                            //top seller
                            singleVendor?const SizedBox():
                            TitleRow(title: getTranslated('top_seller', context),
                              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => const AllTopSellerScreen(topSeller: null,)));},),
                            singleVendor?const SizedBox(height: 0):const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            singleVendor?const SizedBox():
                            const Padding(
                              padding: EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                              child: TopSellerView(isHomePage: true),
                            ),





                            //footer banner
                            Consumer<BannerProvider>(builder: (context, footerBannerProvider, child){
                              return footerBannerProvider.footerBannerList != null && footerBannerProvider.footerBannerList!.isNotEmpty?
                              const Padding(
                                padding: EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                                child: FooterBannersView(index: 0,),
                              ):const SizedBox();
                            }),





                            // Featured Products
                            Consumer<ProductProvider>(
                                builder: (context, featured,_) {
                                  return featured.featuredProductList.isNotEmpty ?
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
                                      child: TitleRow(title: getTranslated('featured_products', context),
                                          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreen(productType: ProductType.featuredProduct)));}),
                                    ),
                                  ):const SizedBox();
                                }
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                              child: FeaturedProductView(scrollController: _scrollController, isHome: true,),
                            ),






                            // Featured Deal
                            Consumer<FeaturedDealProvider>(
                              builder: (context, featuredDealProvider, child) {
                                return featuredDealProvider.featuredDealProductList.isNotEmpty ?
                                Padding(padding: const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
                                  child: TitleRow(title: getTranslated('featured_deals', context),
                                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => const FeaturedDealScreen()));}),
                                ) : const SizedBox.shrink();},),

                            Consumer<FeaturedDealProvider>(
                              builder: (context, featuredDealProvider, child) {
                                return featuredDealProvider.featuredDealProductList.isNotEmpty ?
                                Container(height: featuredDealProvider.featuredDealProductList.length> 4 ? 120 * 4.0 : 120 * (double.parse(featuredDealProvider.featuredDealProductList.length.toString())),
                                    child: const Padding(
                                      padding: EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                                      child: FeaturedDealsView(),
                                    )) : const SizedBox.shrink();},),




                            const Padding(
                              padding: EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                              child: RecommendedProductView(),
                            ),





                            //footer banner
                            Consumer<BannerProvider>(builder: (context, footerBannerProvider, child){
                              return footerBannerProvider.mainSectionBannerList != null &&
                                  footerBannerProvider.mainSectionBannerList!.isNotEmpty?
                              const Padding(
                                padding: EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                                child: MainSectionBannersView(index: 0,),
                              ):const SizedBox();

                            }),



                            // // Latest Products
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            //   child: TitleRow(title: getTranslated('latest_products', context),
                            //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreen(
                            //           productType: ProductType.LATEST_PRODUCT)));}),
                            // ),
                            // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            // // LatestProductView(scrollController: _scrollController),
                            // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            //
                            //
                            //
                            // //Home category
                            // HomeCategoryProductView(isHomePage: true),
                            // SizedBox(height: Dimensions.HOME_PAGE_PADDING),
                            //
                            //
                            //
                            // //footer banner
                            // Consumer<BannerProvider>(builder: (context, footerBannerProvider, child){
                            //   return footerBannerProvider.footerBannerList != null && footerBannerProvider.footerBannerList.length>1?
                            //   FooterBannersView(index: 1):SizedBox();
                            // }),
                            // SizedBox(height: Dimensions.HOME_PAGE_PADDING),


                            //Category filter
                            // Consumer<ProductProvider>(
                            //     builder: (ctx,prodProvider,child) {
                            //   return Padding(
                            //     padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            //     child: Row(children: [
                            //       Expanded(child: Text(prodProvider.title == 'xyz' ? getTranslated('new_arrival',context):prodProvider.title, style: titleHeader)),
                            //       prodProvider.latestProductList != null ? PopupMenuButton(
                            //         itemBuilder: (context) {
                            //           return [
                            //             PopupMenuItem(value: ProductType.NEW_ARRIVAL, child: Text(getTranslated('new_arrival',context)), textStyle: robotoRegular.copyWith(
                            //               color: Theme.of(context).hintColor,
                            //                )),
                            //             PopupMenuItem(value: ProductType.TOP_PRODUCT, child: Text(getTranslated('top_product',context)), textStyle: robotoRegular.copyWith(
                            //               color: Theme.of(context).hintColor,
                            //               )),
                            //             PopupMenuItem(value: ProductType.BEST_SELLING, child: Text(getTranslated('best_selling',context)), textStyle: robotoRegular.copyWith(
                            //               color: Theme.of(context).hintColor,
                            //              )),
                            //             PopupMenuItem(value: ProductType.DISCOUNTED_PRODUCT, child: Text(getTranslated('discounted_product',context)), textStyle: robotoRegular.copyWith(
                            //               color: Theme.of(context).hintColor,
                            //             )),
                            //           ];
                            //         },
                            //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL)),
                            //         child: Padding(
                            //           padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL,vertical:Dimensions.PADDING_SIZE_SMALL ),
                            //           child: Image.asset(Images.dropdown, scale: 3,),
                            //         ),
                            //         onSelected: (value) {
                            //           if(value == ProductType.NEW_ARRIVAL){
                            //             Provider.of<ProductProvider>(context, listen: false).changeTypeOfProduct(value, types[0]);
                            //           }else if(value == ProductType.TOP_PRODUCT){
                            //             Provider.of<ProductProvider>(context, listen: false).changeTypeOfProduct(value, types[1]);
                            //           }else if(value == ProductType.BEST_SELLING){
                            //             Provider.of<ProductProvider>(context, listen: false).changeTypeOfProduct(value, types[2]);
                            //           }else if(value == ProductType.DISCOUNTED_PRODUCT){
                            //             Provider.of<ProductProvider>(context, listen: false).changeTypeOfProduct(value, types[3]);
                            //           }
                            //
                            //           ProductView(isHomePage: false, productType: value, scrollController: _scrollController);
                            //           Provider.of<ProductProvider>(context, listen: false).getLatestProductList(1, context, reload: true);
                            //
                            //
                            //         }
                            //       ) : SizedBox(),
                            //     ]),
                            //   );
                            // }),
                            // ProductView(isHomePage: false, productType: ProductType.NEW_ARRIVAL, scrollController: _scrollController),
                            // SizedBox(height: Dimensions.HOME_PAGE_PADDING),

                          ],
                        ),
                      ),
                    )
                  ],
                ),

                Provider.of<SplashProvider>(context, listen: false).configModel!.announcement!.status == '1'?
                Positioned(top: MediaQuery.of(context).size.height-128,
                  left: 0,right: 0,
                  child: Consumer<SplashProvider>(
                    builder: (context, announcement, _){
                      return (announcement.configModel!.announcement!.announcement != null && announcement.onOff)?
                      AnnouncementScreen(announcement: announcement.configModel!.announcement):const SizedBox();
                    },

                  ),
                ):const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }


}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  SliverDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 70 || oldDelegate.minExtent != 70 || child != oldDelegate.child;
  }
}
