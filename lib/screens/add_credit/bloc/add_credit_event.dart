part of 'add_credit_bloc.dart';

@immutable
abstract class AddCreditEvent {}

class CalculateDataEvent extends AddCreditEvent {
  final int creditAmount;
  final int interestRate;
  final int creditPeriod;

  CalculateDataEvent(
      {required this.creditAmount,
      required this.interestRate,
      required this.creditPeriod});
}

class AddingCreditEvent extends AddCreditEvent {
  final CreditModel creditModel;

  AddingCreditEvent({required this.creditModel});

}
