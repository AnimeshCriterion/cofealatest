import 'package:ottu/ottu.dart';
import 'package:flutter/material.dart';
import 'package:ottu/paymentDelegate/paymentDelegate.dart';




class PaymentGateWayScreen extends StatefulWidget {
  const PaymentGateWayScreen({Key? key}) : super(key: key);

  @override
  State<PaymentGateWayScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PaymentGateWayScreen> implements PaymentDelegate {
  Ottu ottu = Ottu();
  String lan = 'en';
  void openSDK() async {
    try {
      await ottu.open(
        context,
        'session_id',
        'API_KEY',
        'MERCHANT_ID',
        this,
        lang: lan,
      );
    } catch (e) {
      rethrow;
    }
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
  void errorCallback(String paymentStatus) {}

  @override
  void beforeRedirect(String paymentStatus) {}

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
}