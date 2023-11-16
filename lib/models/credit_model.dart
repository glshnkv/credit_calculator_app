enum CreditType {
  vehcle,
  personal,
  home,
}

class CreditModel {
  final int creditAmount;
  final int interestRate;
  final int creditPeriod;
  String date;
  final int paid;

  final int totalPayments;
  final int monthlyPayment;
  final int fullCost;
  final int overpayment;

  CreditModel(
      {
      required this.paid,
      required this.creditAmount,
      required this.interestRate,
      required this.creditPeriod,
      required this.date,
      required this.totalPayments,
      required this.monthlyPayment,
      required this.fullCost,
      required this.overpayment});
}
