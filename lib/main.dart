import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentapp/presentation/views/home_view.dart';
import 'core/keys/api_keys.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
   Stripe.publishableKey = ApiKeys.publishableKey;
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

