import 'package:credit_calculator_app/credit_calculator_app.dart';
import 'package:credit_calculator_app/repository/credit_repository.dart';
import 'package:credit_calculator_app/screens/add_credit/bloc/add_credit_bloc.dart';
import 'package:credit_calculator_app/screens/credits_list/bloc/credits_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await GetIt.instance.registerSingleton(CreditRepository());

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CreditsListBloc>(
          create: (context) => CreditsListBloc(GetIt.I<CreditRepository>())),
      BlocProvider<AddCreditBloc>(
          create: (context) => AddCreditBloc(GetIt.I<CreditRepository>())),
    ],
    child: CreditCalculatorApp(),
  ));
}
