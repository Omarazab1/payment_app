import 'package:flutter/material.dart';
import 'package:paymentapp/views/home_view.dart';



void main() {
  runApp(const PaymentApp());
}


class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

