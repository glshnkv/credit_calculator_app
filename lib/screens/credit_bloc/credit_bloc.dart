import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:credit_calculator_app/models/credit_model.dart';
import 'package:credit_calculator_app/models/payment_model.dart';
import 'package:credit_calculator_app/repository/credit_repository.dart';
import 'package:meta/meta.dart';

part 'credit_event.dart';

part 'credit_state.dart';

class CreditBloc extends Bloc<CreditEvent, CreditState> {
  final CreditRepository _repository;

  CreditBloc(this._repository) : super(CreditInitial()) {
    on<AddingCreditEvent>(_addingCreditHandler);
    on<AddingPaymentEvent>(_addingPaymentHandler);
    on<DeleteCreditEvent>(_deleteCreditHandler);

    _initialize();
  }

  void _addingCreditHandler(
      AddingCreditEvent event, Emitter<CreditState> emit) {
    _repository.addNewCredit(event.creditModel);
    _repository.getCredits;
  }

  void _addingPaymentHandler(
      AddingPaymentEvent event, Emitter<CreditState> emit) {
    event.creditModel.paid += event.amount;

    DateTime now = DateTime.now();
    String convertedDateTime =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";
    PaymentModel _paymentModel =
        PaymentModel(amount: event.amount, date: convertedDateTime);
    event.creditModel.paymentsHistory.add(_paymentModel);
  }

  void _deleteCreditHandler(
      DeleteCreditEvent event, Emitter<CreditState> emit) {
    _repository.deleteCredit(event.creditModel.id.toInt());
  }

  _initialize() async {
    emit(LoadedCreditsListState(creditList: _repository.getCredits));
  }
}
