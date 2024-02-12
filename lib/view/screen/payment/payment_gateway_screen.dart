import 'dart:convert';
import 'dart:math';

import 'package:ottu/ottu.dart';
import 'package:flutter/material.dart';
import 'package:ottu/paymentDelegate/paymentDelegate.dart';
import 'package:http/http.dart' as http;



class PaymentGateWayScreen extends StatefulWidget {
  final String? addressID;
  final String? billingId;
  final String? orderNote;
  final String? customerID;
  final String? couponCode;
  final String? walletBalance;
  final String? voucharCode;

  const PaymentGateWayScreen(   {Key? key, @required this.addressID,
    @required this.customerID,
    @required this.couponCode,
    @required this.billingId,
    this.orderNote,
    this.walletBalance,
    this.voucharCode}) : super(key: key);

  @override
  State<PaymentGateWayScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PaymentGateWayScreen> implements PaymentDelegate {
  Ottu ottu = Ottu();
  String lan = 'en';
  String sessionID="";
  void openSDK() async {
    try {
      await ottu.open(
        context,
        sessionID,
        'aZ0KMav7.b51UCtxUvPnJeM7dVtuOSViwYQm3KTrG',
        'online.cofea.com',
        this,
        lang: lan,
      );
    } catch (e) {
      rethrow;
    }
  }


  @override
  void initState() {
  generateSessionKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Open SDK'),
          onPressed: () {
            openSDK();
          },
        ),
      ),
    );
  }

  @override
  void successCallback(String paymentStatus) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        backgroundColor: Colors.green,
        content:
        Text(paymentStatus, style: const TextStyle(color: Colors.white)),
        actions: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('ok'),
          )
        ],
      ),
    );
  }

  @override
  void errorCallback(String paymentStatus) {
    print("Error$paymentStatus");
  }

  @override
  void beforeRedirect(String paymentStatus) {
    print("BeforeRedirect$paymentStatus");
  }

  @override
  void cancelCallback(String paymentStatus) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        backgroundColor: Colors.red,
        content: Text(
          paymentStatus,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('ok'),
          )
        ],
      ),
    );
  }

  Future<void> generateSessionKey() async {

    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'Cookie_1=value; Cookie_2=value'
    };
    var request = http.Request('POST', Uri.parse('https://test.cofea.com/api/v1/get_session'));
    request.body = json.encode(
        {
          "amount":100,
          "customer_id":widget.customerID.toString(),
          "customer_email":"fsyed97@gmail.com",
          "customer_first_name":"faraz",
          "customer_last_name":"syed",
          "customer_phone":123456,
          "mobile_wallet_discount":widget.walletBalance,
          "mobile_gift_voucher":25,
          "giftVoucherCode":widget.voucharCode.toString(),
          "mobile_coupon_discount":10,
          "coupon_code":widget.couponCode.toString(),
          "billing_address_id":widget.billingId.toString(),
          "pg_code":"knet-test"
        }
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data=jsonDecode(await await response.stream.bytesToString());
      setState(() {
        sessionID=data['session_id'].toString();
        print("SessionDdd${data['session_id']}");
      });

    }
    else {
    print(response.reasonPhrase);
    }


  }
}