import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentapp/data/models/payment_intent_model/payment_intent_input_model.dart';
import '../../cubits/payment/check_out_cubit.dart';
import '../../cubits/payment/check_out_state.dart';
import '../thank_you_view.dart';
import 'custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< CheckOutCubit, CheckOutState>(
      builder: (context, state) {
        return  CustomButton(
          isLoading:  state is CheckOutLoading ? true : false,
            backgroundColor: Colors.green,
            buttonName: 'Pay',
            onPressed: (){
            PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
              amount: '100',
              currency: 'USD',
            );
              BlocProvider.of<CheckOutCubit>(context).makePayment(
                  paymentIntentInputModel: paymentIntentInputModel);
            });
      },
      listener: (context, state) {
        if (state is CheckOutSuccess) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ThankYouView(),),);
        }
        if (state is CheckOutFailure) {
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);


        }
      },

    );
  }
}
