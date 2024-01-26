import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_loader.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../localization/language_constrants.dart';
import '../../../provider/wallet_transaction_provider.dart';
import '../../../utill/images.dart';

class WebViewScreen extends StatefulWidget {
  final String? title;
  final String? url;
  const WebViewScreen({Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  WebViewController? controllerGlobal;
  bool _isLoading = true;

  String address = "";
  String mapLink = "";
  String phoneNumber = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    Provider.of<WalletTransactionProvider>(context, listen: false).getContactUsData(context,1);
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  Future<void> _openMap(String address) async {
    // URL format for launching a map with the specified address
    final url = 'https://www.google.com/maps/search/?api=1&query=$address';

    // Launch the map URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  hitapi() async {
    var request =
        http.Request('GET', Uri.parse('https://cofea.com/api/v1/contact-us'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
  //    print(await response.stream.bytesToString());
      var data=jsonDecode(await response.stream.bytesToString());
      address=data['data']['address'];
      mapLink=data['data']['maplink'];
      email=data['data']['email'];
      phoneNumber=(data['data']['phone']);
      print("Animeshfedsg"+phoneNumber.toString());
      setState(() {

      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _exitApp,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        // body: Column(
        //   children: [
        //
        //     CustomAppBar(title: widget.title),
        //
        //     Expanded(
        //       child: Stack(
        //         children: [
        //           WebView(
        //             javascriptMode: JavascriptMode.unrestricted,
        //             initialUrl: widget.url,
        //             gestureNavigationEnabled: true,
        //             onWebViewCreated: (WebViewController webViewController) {
        //               _controller.future.then((value) => controllerGlobal = value);
        //               _controller.complete(webViewController);
        //             },
        //             onPageStarted: (String url) {
        //               if (kDebugMode) {
        //                 print('Page started loading: $url');
        //               }
        //               setState(() {
        //                 _isLoading = true;
        //               });
        //             },
        //             onPageFinished: (String url) {
        //               if (kDebugMode) {
        //                 print('Page finished loading: $url');
        //               }
        //               setState(() {
        //                 _isLoading = false;
        //               });
        //             },
        //           ),
        //
        //           _isLoading ? CustomLoader(color: Theme.of(context).primaryColor) : const SizedBox.shrink(),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        body: Consumer<WalletTransactionProvider>(
          builder: (context, profile, child) {
            return Scaffold(
              appBar: AppBar(
                title:  Text(getTranslated('contact_details', context)!),
              ),
              body: Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, right: 0, top: 0, bottom: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(Images.contactusImage),
                      const SizedBox(height: 20.0),
                      _buildContactRow(
                          title:getTranslated('phone_number', context)!,
                          value: '+${profile.getContactUs?.data?.phone} ',
                          icon: Icons.phone,
                          onTap: (){
                            launch("tel://${profile.getContactUs?.data?.phone}");
                          }
                      ),
                      const SizedBox(height: 16.0),
                      _buildContactRow(
                          title: getTranslated('EMAIL', context)!,
                          value: '${profile.getContactUs?.data?.email}',
                          icon: Icons.email,
                          onTap: () async {
                            final email = Uri(
                              scheme: 'mailto',
                              path: 'info@example.com',
                              query: 'subject=&body=',
                            );
                            if (await canLaunchUrl(email)) {
                              launchUrl(email);
                            } else {
                              throw 'Could not launch $email';
                            }
                          }
                      ),
                      const SizedBox(height: 16.0),
                      _buildContactRow(
                        title: getTranslated('address', context)!,
                        value:
                        '${profile.getContactUs?.data?.address}',
                        icon: Icons.location_on,
                        onTap: () {
                  
                          _openMap('${profile.getContactUs?.data?.address}');
                        },
                      ),
                      const SizedBox(height: 16.0),
                      _buildContactRow(
                        title:  getTranslated('map', context)!,
                        value: '${profile.getContactUs?.data?.maplink}',
                        icon: Icons.location_on,
                        onTap: () async {
                          if (await canLaunchUrl(Uri.parse(profile.getContactUs!.data!.maplink!))) {
                            launchUrl(Uri.parse(profile.getContactUs!.data!.maplink!));
                          } else {
                            throw 'Could not launch $email';
                          }
                          // _openMap(
                          //     '${mapLink}');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),




      ),
    );
  }

  Widget _buildContactRow({
    required String title,
    required String value,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 30.0,
              color: ColorResources.black,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    value,
                    style: onTap != null
                        ? const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _exitApp() async {
    if (controllerGlobal != null) {
      if (await controllerGlobal!.canGoBack()) {
        controllerGlobal!.goBack();
        return Future.value(false);
      } else {
        return Future.value(true);
      }
    } else {
      return Future.value(true);
    }
  }
}
