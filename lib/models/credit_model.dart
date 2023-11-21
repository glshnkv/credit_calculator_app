import 'package:credit_calculator_app/models/payment_model.dart';
import 'package:uuid/uuid.dart';

enum CreditType {
  vehcle,
  personal,
  home,
}

class CreditModel {
  final int id;
  final int creditAmount;
  final int interestRate;
  final int creditPeriod;
  String date;
  int paid;
  List<PaymentModel> paymentsHistory;

  final int totalPayments;
  final int monthlyPayment;
  final int fullCost;
  final int overpayment;

  CreditModel(
      {required this.id,
      required this.paid,
      required this.creditAmount,
      required this.interestRate,
      required this.creditPeriod,
      required this.date,
      required this.totalPayments,
      required this.monthlyPayment,
      required this.fullCost,
      required this.overpayment,
        required this.paymentsHistory});
}
