abstract class CheckOutState {}

class CheckOutInitial extends CheckOutState {}

class CheckOutLoading extends CheckOutState {}

class CheckOutFailure extends CheckOutState {
  final String errMessage;

  CheckOutFailure({required this.errMessage});
}

class CheckOutSuccess extends CheckOutState {}