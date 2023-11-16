import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:credit_calculator_app/models/credit_model.dart';
import 'package:credit_calculator_app/repository/credit_repository.dart';
import 'package:meta/meta.dart';

part 'add_credit_event.dart';

part 'add_credit_state.dart';

class AddCreditBloc extends Bloc<AddCreditEvent, AddCreditState> {
  final CreditRepository _repository;

  AddCreditBloc(this._repository) : super(AddCreditInitial()) {
    on<CalculateDataEvent>(_CalculateDataHandler);
    on<AddingCreditEvent>(_AddingCreditHandler);

    _initialize();
  }

  void _CalculateDataHandler(
      CalculateDataEvent event, Emitter<AddCreditState> emit) {
    double totalPayments = event.creditAmount * (1 + event.interestRate / 100);
    double monthlyPayment = totalPayments / event.creditPeriod;
    double fullCost = totalPayments - event.creditAmount;
    double overpayment = fullCost - event.creditAmount;
    emit(
      CalculatedDataState(
          totalPayments: totalPayments.round(),
          monthlyPayment: monthlyPayment.round(),
          fullCost: fullCost.round(),
          overpayment: overpayment.round(),
    ));
  }

  void _AddingCreditHandler(
      AddingCreditEvent event, Emitter<AddCreditState> emit) {
    _repository.addNewCredit(event.creditModel);
    _repository.getCredits;
  }

  _initialize() async {
    emit(LoadedAddCreditState());
  }
}
