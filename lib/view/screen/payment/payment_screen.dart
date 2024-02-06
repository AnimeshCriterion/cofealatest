import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/animated_custom_dialog.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_loader.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/my_dialog.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/dashboard/dashboard_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  final String? addressID;
  final String? billingId;
  final String? orderNote;
  final String? customerID;
  final String? couponCode;
  final String? walletBalance;
  final String? voucharCode;

  PaymentScreen(
      {Key? key, @required this.addressID,
      @required this.customerID,
      @required this.couponCode,
      @required this.billingId,
      this.orderNote,
      this.walletBalance,
      this.voucharCode}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? selectedUrl;
  double value = 0.0;
  bool _isLoading = true;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  WebViewController? controllerGlobal;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print("CheckEverything" +
        widget.couponCode.toString() +
        widget.walletBalance.toString());
    // selectedUrl = '${AppConstants.BASE_URL}/customer/payment-mobile?customer_id='
    //     '${widget.customerID}&address_id=${widget.addressID}&coupon_code='
    //     '${widget.couponCode}&billing_address_id=${widget.billingId}&order_note=${widget.orderNote}';
    selectedUrl =
        '${AppConstants.baseUrl}customer/payment-mobile?customer_id=${widget.customerID}&billing_address_id=${widget.billingId}&mobile_wallet_discount=${widget.walletBalance.toString()}&mobile_gift_voucher=${widget.voucharCode}&mobile_coupon_discount=${widget.couponCode}';
    print(selectedUrl);

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  void dispose() {
    // _navigator.pushAndRemoveUntil();
    super.dispose();
  }

  late NavigatorState _navigator;

  @override
  void didChangeDependencies() {
    _navigator = Navigator.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            CustomAppBar(
                title: getTranslated('PAYMENT', context),
                onBackPressed: () => _exitApp(context)),
            Expanded(
              child: Stack(
                children: [
                  WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: selectedUrl,
                    gestureNavigationEnabled: true,
                    userAgent:
                        'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E233 Safari/601.1',
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.future
                          .then((value) => controllerGlobal = value);
                      _controller.complete(webViewController);
                    },
                    onPageStarted: (String url) {
                      print('Started url: $url');
                      if (url.contains(AppConstants.baseUrl)) {
                        bool _isSuccess = url.contains('success');
                        bool _isFailed = url.contains('fail');
                        bool _isError = url.contains('error');
                        setState(() {
                          _isLoading = true;
                        });
                        if (_isSuccess) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) => const DashBoardScreen()),
                              (route) => false);
                          showAnimatedDialog(
                              context,
                              MyDialog(
                                icon: Icons.done,
                                title: getTranslated('payment_done', context),
                                description: getTranslated(
                                    'your_payment_successfully_done', context),
                              ),
                              dismissible: false,
                              isFlip: true);
                        }
                        else {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) => const DashBoardScreen()),
                              (route) => false);

                          showAnimatedDialog(
                              context,
                              MyDialog(
                                icon: Icons.clear,
                                title: getTranslated('payment_failed', context),
                                description: getTranslated(
                                    'your_payment_failed', context),
                                isFailed: true,
                              ),
                              dismissible: false,
                              isFlip: true);
                        }

                      }
                    },
                    onPageFinished: (String url) {
                      print('Started url finished: $url');
                      setState(() {
                        _isLoading = false;
                      });
                      if (url.contains(AppConstants.baseUrl)) {
                        bool _isSuccess = url.contains('success');
                        bool _isFailed = url.contains('fail');
                        bool isWrong = url.contains('error');
                        if (_isSuccess) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) => const DashBoardScreen()),
                                  (route) => false);

                          showAnimatedDialog(
                              context,
                              MyDialog(
                                icon: Icons.done,
                                title: getTranslated('payment_done', context),
                                description: getTranslated(
                                    'your_payment_successfully_done', context),
                              ),
                              dismissible: false,
                              isFlip: true);
                        }
                        else {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) => const DashBoardScreen()),
                                  (route) => false);
                          showAnimatedDialog(
                              context,
                              MyDialog(
                                icon: Icons.clear,
                                title: getTranslated('payment_failed', context),
                                description: getTranslated(
                                    'your_payment_failed', context),
                                isFailed: true,
                              ),
                              dismissible: false,
                              isFlip: true);
                        }

                      }
                    },
                  ),
                  _isLoading
                      ? Center(
                          child: CustomLoader(
                              color: Theme.of(context).primaryColor),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _exitApp(BuildContext context) async {
    if (await controllerGlobal!.canGoBack()) {
      controllerGlobal!.goBack();
      return Future.value(false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const DashBoardScreen()),
          (route) => false);
      showAnimatedDialog(
          context,
          MyDialog(
            icon: Icons.clear,
            title: getTranslated('payment_cancelled', context),
            description: getTranslated('your_payment_cancelled', context),
            isFailed: true,
          ),
          dismissible: false,
          isFlip: true);
      return Future.value(true);
    }
  }
}
