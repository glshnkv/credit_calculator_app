part of 'add_credit_bloc.dart';

@immutable
abstract class AddCreditState {}

class AddCreditInitial extends AddCreditState {}

class LoadedAddCreditState extends AddCreditState {}

class CalculatedDataState extends AddCreditState {
  final int totalPayments;
  final int monthlyPayment;
  final int fullCost;
  final int overpayment;

  CalculatedDataState(
      {required this.totalPayments,
      required this.monthlyPayment,
      required this.fullCost,
      required this.overpayment});
}
