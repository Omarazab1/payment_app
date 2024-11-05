import 'package:paymentapp/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:paymentapp/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:paymentapp/utils/api_keys.dart';
import 'package:paymentapp/utils/api_service.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel) async
  {
    apiService.post(
        url: 'https://api.stripe.com/v1/payment_intents',
        body: paymentIntentInputModel.toJson(),
        token: ApiKeys.secretKey,
    );
  }
}