import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/product_shimmer.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/product_widget.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../../provider/product_details_provider.dart';
import 'combo_product.dart';

class ComboProductView extends StatelessWidget {
  const ComboProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsProvider>(
      builder: (context, prodProvider, child) {
        return Column(children: [
          prodProvider.comboProductList != null ? prodProvider.comboProductList!.isNotEmpty ? StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: prodProvider.comboProductList!.length,
            shrinkWrap: true,
        scrollDirection: Axis.vertical,
            staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
            itemBuilder: (BuildContext context, int index) {
              return ComboProductWidget(productModel: prodProvider.comboProductList![index]);
            },
          ): const Center(child: Text('No Combo Product Found')) :
          ProductShimmer(isHomePage: false, isEnabled: Provider.of<ProductDetailsProvider>(context).comboProductList == null),
        ]);
      },
    );
  }
}
