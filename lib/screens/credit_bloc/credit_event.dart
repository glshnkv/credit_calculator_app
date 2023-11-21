part of 'credit_bloc.dart';

@immutable
abstract class CreditEvent {}

class AddingCreditEvent extends CreditEvent {
  final CreditModel creditModel;

  AddingCreditEvent({required this.creditModel});
}

class AddingPaymentEvent extends CreditEvent {
  final CreditModel creditModel;
  final int amount;

  AddingPaymentEvent({required this.amount, required this.creditModel});
}

class DeleteCreditEvent extends CreditEvent {
  final CreditModel creditModel;

  DeleteCreditEvent({required this.creditModel});
}

