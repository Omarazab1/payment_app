import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentapp/data/repos/check_out_repo.dart';

import '../../../data/models/payment_intent_model/payment_intent_input_model.dart';
import 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  final CheckOutRepo checkOutRepo;
  CheckOutCubit(this.checkOutRepo) : super(CheckOutInitial());


  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(CheckOutLoading());
    final result = await checkOutRepo.makePayment(paymentIntentInputModel: paymentIntentInputModel);
    result.fold(
            (l) => emit(CheckOutFailure(errMessage: l.toString())),
            (r) => emit(CheckOutSuccess()));
  }
 @override
  void onChange(Change<CheckOutState> change) {
    log(change.toString());
    super.onChange(change);
  }
}