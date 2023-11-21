// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<AddPaymentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddPaymentScreen(
          key: args.key,
          creditModel: args.creditModel,
        ),
      );
    },
    AppCreditRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppCreditScreen(),
      );
    },
    CreditInfoRoute.name: (routeData) {
      final args = routeData.argsAs<CreditInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreditInfoScreen(
          key: args.key,
          credit: args.credit,
        ),
      );
    },
    CreditsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreditsListScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    PaymentHistoryRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentHistoryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PaymentHistoryScreen(
          key: args.key,
          list: args.list,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [AddPaymentScreen]
class AddPaymentRoute extends PageRouteInfo<AddPaymentRouteArgs> {
  AddPaymentRoute({
    Key? key,
    required CreditModel creditModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddPaymentRoute.name,
          args: AddPaymentRouteArgs(
            key: key,
            creditModel: creditModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddPaymentRoute';

  static const PageInfo<AddPaymentRouteArgs> page =
      PageInfo<AddPaymentRouteArgs>(name);
}

class AddPaymentRouteArgs {
  const AddPaymentRouteArgs({
    this.key,
    required this.creditModel,
  });

  final Key? key;

  final CreditModel creditModel;

  @override
  String toString() {
    return 'AddPaymentRouteArgs{key: $key, creditModel: $creditModel}';
  }
}

/// generated route for
/// [AppCreditScreen]
class AppCreditRoute extends PageRouteInfo<void> {
  const AppCreditRoute({List<PageRouteInfo>? children})
      : super(
          AppCreditRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppCreditRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreditInfoScreen]
class CreditInfoRoute extends PageRouteInfo<CreditInfoRouteArgs> {
  CreditInfoRoute({
    Key? key,
    required CreditModel credit,
    List<PageRouteInfo>? children,
  }) : super(
          CreditInfoRoute.name,
          args: CreditInfoRouteArgs(
            key: key,
            credit: credit,
          ),
          initialChildren: children,
        );

  static const String name = 'CreditInfoRoute';

  static const PageInfo<CreditInfoRouteArgs> page =
      PageInfo<CreditInfoRouteArgs>(name);
}

class CreditInfoRouteArgs {
  const CreditInfoRouteArgs({
    this.key,
    required this.credit,
  });

  final Key? key;

  final CreditModel credit;

  @override
  String toString() {
    return 'CreditInfoRouteArgs{key: $key, credit: $credit}';
  }
}

/// generated route for
/// [CreditsListScreen]
class CreditsListRoute extends PageRouteInfo<void> {
  const CreditsListRoute({List<PageRouteInfo>? children})
      : super(
          CreditsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreditsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PaymentHistoryScreen]
class PaymentHistoryRoute extends PageRouteInfo<PaymentHistoryRouteArgs> {
  PaymentHistoryRoute({
    Key? key,
    required List<PaymentModel> list,
    List<PageRouteInfo>? children,
  }) : super(
          PaymentHistoryRoute.name,
          args: PaymentHistoryRouteArgs(
            key: key,
            list: list,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentHistoryRoute';

  static const PageInfo<PaymentHistoryRouteArgs> page =
      PageInfo<PaymentHistoryRouteArgs>(name);
}

class PaymentHistoryRouteArgs {
  const PaymentHistoryRouteArgs({
    this.key,
    required this.list,
  });

  final Key? key;

  final List<PaymentModel> list;

  @override
  String toString() {
    return 'PaymentHistoryRouteArgs{key: $key, list: $list}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
