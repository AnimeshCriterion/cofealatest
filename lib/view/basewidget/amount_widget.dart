import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';

class AmountWidget extends StatelessWidget {
  final String? title;
  final String amount;

  const AmountWidget({Key? key, required this.title, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title!, style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeDefault)),
        Text(amount, style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeDefault)),
      ]),
    );
  }
}


class AmountWidget1 extends StatelessWidget {
  final String? title;
  final String? amount;
  final GestureTapCallback? onTap;

  AmountWidget1({@required this.title, @required this.amount, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title!, style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT)),
        Row(
          children: [
            Text(amount!, style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT)),
            Visibility(
                visible:double.parse(amount.toString().replaceAll("KD", ""))>0 ,
                child: InkWell(
                    onTap: onTap!,
                    child: Icon(Icons.delete_forever,color: Colors.red,)))
          ],
        ),
      ]),
    );
  }
}
