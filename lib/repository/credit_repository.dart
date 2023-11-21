import 'package:credit_calculator_app/models/credit_model.dart';
import 'package:uuid/uuid.dart';

class CreditRepository {
  final List<CreditModel> _list = [
    CreditModel(
      id: DateTime.now().millisecondsSinceEpoch + 1,
      creditAmount: 29,
      interestRate: 7,
      creditPeriod: 12,
      date: '01/08/2020',
      totalPayments: 377,
      paid: 299,
      monthlyPayment: 44,
      fullCost: 177,
      overpayment: 1293,
      paymentsHistory: [],
    ),
    CreditModel(
      id: DateTime.now().millisecondsSinceEpoch + 2,
      creditAmount: 29,
      interestRate: 7,
      creditPeriod: 12,
      date: '01/08/2020',
      totalPayments: 7777,
      paid: 2777,
      monthlyPayment: 44,
      fullCost: 183,
      overpayment: 17899,
      paymentsHistory: [],
    ),
    CreditModel(
      id: DateTime.now().millisecondsSinceEpoch + 3,
      creditAmount: 29,
      interestRate: 7,
      creditPeriod: 12,
      date: '01/08/2020',
      totalPayments: 100200,
      paid: 50000,
      monthlyPayment: 44,
      fullCost: 109,
      overpayment: 100032,
      paymentsHistory: [],
    ),
  ];

  List<CreditModel> get getCredits => _list;

  void addNewCredit(CreditModel credit) => _list.add(credit);

  void deleteCredit(int id) => _list.removeWhere((item) => item.id == id);
}
