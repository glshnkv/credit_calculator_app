import 'package:credit_calculator_app/credit_calculator_app.dart';
import 'package:credit_calculator_app/repository/credit_repository.dart';
import 'package:credit_calculator_app/screens/credit_bloc/credit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await GetIt.instance.registerSingleton(CreditRepository());

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CreditBloc>(
          create: (context) => CreditBloc(GetIt.I<CreditRepository>())),
    ],
    child: CreditCalculatorApp(),
  ));
}
