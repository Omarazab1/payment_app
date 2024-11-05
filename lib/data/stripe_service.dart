import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentapp/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:paymentapp/data/models/payment_intent_model/payment_intent_model.dart';
import '../core/keys/api_keys.dart';
import '../core/utils/api_service.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel) async
  {
   var response = await apiService.post(
        url: 'https://api.stripe.com/v1/payment_intents',
        body: paymentIntentInputModel.toJson(),
        token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson( response.data );

   return paymentIntentModel;
  }


  Future initPaymentSheet({required String paymentIntentClientSecret}) async{
     await Stripe.instance.initPaymentSheet(
         paymentSheetParameters:  SetupPaymentSheetParameters(
           merchantDisplayName: 'Omar Essam',
           paymentIntentClientSecret: paymentIntentClientSecret,
         ),

     );
  }

  Future displayPaymentSheet() async{
    await Stripe.instance.presentPaymentSheet();
  }
}