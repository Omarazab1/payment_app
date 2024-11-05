import 'package:flutter/material.dart';
import 'package:paymentapp/views/widgets/custom_button.dart';
import 'package:paymentapp/views/widgets/details_text.dart';
import 'package:paymentapp/views/widgets/payment_methods_bottom_sheet.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Image.asset('assets/images/basket.png'),
                const SizedBox(height: 15,),
                const DetailsText(text1: 'Order Subtotal', text2: '\$42.97'),
                const SizedBox(height: 5,),
                const DetailsText(text1: 'Discount', text2: '\$0'),
                const SizedBox(height: 5,),
                const DetailsText(text1: 'Shipping', text2: '\$12'),
                const SizedBox(height: 5,),
                const Divider(thickness: 2,),
                const SizedBox(height: 5,),
                 const DetailsText(
                  text1: 'Total',
                  text2: '\$54.97',
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 15,),
                CustomButton(
                    backgroundColor: Colors.green,
                    buttonName: 'Complete Payment',
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          builder: (context) {
                            return const PaymentMethodsBottomSheet();

                          });
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
