import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:credit_calculator_app/models/credit_model.dart';
import 'package:credit_calculator_app/repository/credit_repository.dart';
import 'package:meta/meta.dart';

part 'credits_list_event.dart';
part 'credits_list_state.dart';

class CreditsListBloc extends Bloc<CreditsListEvent, CreditsListState> {
  final CreditRepository _repository;

  CreditsListBloc(this._repository) : super(CreditsListInitial()) {
    _initialize();
  }

  _initialize() async {
    emit(LoadedCreditsListState(creditList: _repository.getCredits));
  }
}
