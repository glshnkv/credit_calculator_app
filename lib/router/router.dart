import 'package:auto_route/auto_route.dart';
import 'package:credit_calculator_app/models/credit_model.dart';
import 'package:credit_calculator_app/screens/credits_list/credits_list_screen.dart';
import 'package:credit_calculator_app/screens/onboarding/onboarding_screen.dart';
import 'package:credit_calculator_app/screens/settings/settings_screen.dart';
import 'package:credit_calculator_app/screens/credit_info/credit_info_screen.dart';
import 'package:credit_calculator_app/screens/add_credit/add_credit_screen.dart';
import 'package:credit_calculator_app/screens/add_payment/add_payment_screen.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: CreditsListRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: CreditInfoRoute.page),
    AutoRoute(page: AppCreditRoute.page),
    AutoRoute(page: AddPaymentRoute.page),
  ];
}