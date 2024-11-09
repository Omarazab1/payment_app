import 'package:dartz/dartz.dart';

import 'package:paymentapp/core/utils/failures.dart';
import 'package:paymentapp/core/utils/stripe_service.dart';

import 'package:paymentapp/data/models/payment_intent_model/payment_intent_input_model.dart';

import 'check_out_repo.dart';

class CheckOutRepoImp  extends CheckOutRepo{
  final StripeService stripeService;

  CheckOutRepoImp(this.stripeService);
  @override
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async{ {
    try {
      await stripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    }catch(e){
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}}