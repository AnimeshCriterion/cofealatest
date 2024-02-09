import 'dart:convert';
import 'dart:math';

import 'package:ottu/ottu.dart';
import 'package:flutter/material.dart';
import 'package:ottu/paymentDelegate/paymentDelegate.dart';
import 'package:http/http.dart' as http;



class PaymentGateWayScreen extends StatefulWidget {
  String? customerId;
   PaymentGateWayScreen({Key? key, required this.customerId}) : super(key: key);

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
    print("Error"+paymentStatus.toString());
  }

  @override
  void beforeRedirect(String paymentStatus) {
    print("BeforeRedirect"+paymentStatus.toString());
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
    var request = http.Request('POST', Uri.parse('https://test.cofea.com/api/v1/apple_session'));
    request.body = json.encode({
      "amount": 10,
      "customer_id": widget.customerId.toString(),
      "customer_email": "mail@gmail.com",
      "customer_first_name": "first name",
      "customer_last_name": "last name",
      "customer_phone": 123456,
      "order_no":Random().nextInt(10),
      "pg_code": "knet-test"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data=jsonDecode(await await response.stream.bytesToString());
      setState(() {
        sessionID=data['session_id'].toString();
        print("SessionDdd"+data['session_id'].toString());
      });

    }
    else {
    print(response.reasonPhrase);
    }


  }
}