import 'package:auto_route/auto_route.dart';
import 'package:credit_calculator_app/models/credit_model.dart';
import 'package:credit_calculator_app/repository/credit_repository.dart';
import 'package:credit_calculator_app/router/router.dart';
import 'package:credit_calculator_app/screens/credit_bloc/credit_bloc.dart';
import 'package:credit_calculator_app/screens/payment_history/payment_history_screen.dart';
import 'package:credit_calculator_app/theme/colors.dart';
import 'package:credit_calculator_app/widgets/app_elevated_button.dart';
import 'package:credit_calculator_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

@RoutePage()
class CreditInfoScreen extends StatefulWidget {
  final CreditModel credit;

  const CreditInfoScreen({super.key, required this.credit});

  @override
  State<CreditInfoScreen> createState() => _CreditInfoScreenState();
}

class _CreditInfoScreenState extends State<CreditInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Credit Info',
        onTap: () {
          context.router.push(CreditsListRoute());
        },
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.grey),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 15),
                  child: SizedBox(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.credit.paid}\$',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '${widget.credit.totalPayments}\$',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Container(
                          child: LinearPercentIndicator(
                            width: 339,
                            animation: true,
                            lineHeight: 5.0,
                            animationDuration: 1000,
                            percent: num.parse((widget.credit.paid /
                                        widget.credit.totalPayments)
                                    .toStringAsFixed(2))
                                .toDouble(),
                            progressColor: AppColors.green,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Paid',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Debt',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total payments',
                          style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '${widget.credit.totalPayments}\$',
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monthly payment',
                          style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '${widget.credit.monthlyPayment}\$',
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Full cost of credit',
                          style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '${widget.credit.fullCost}%',
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Overpayment',
                          style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '${widget.credit.overpayment}\$',
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 160,
              ),
              Column(
                children: [
                  AppElevatedButton(
                    buttonColor: AppColors.red,
                    textColor: AppColors.white,
                    text: 'Add payment',
                    onPressed: () {
                      context.router
                          .push(AddPaymentRoute(creditModel: widget.credit));
                    },
                  ),
                  AppElevatedButton(
                    buttonColor: AppColors.lightgrey,
                    textColor: AppColors.black,
                    text: 'Schedule',
                    onPressed: () {},
                  ),
                  AppElevatedButton(
                    buttonColor: AppColors.lightgrey,
                    textColor: AppColors.black,
                    text: 'History',
                    onPressed: () {
                      context.router.push(PaymentHistoryRoute(list: widget.credit.paymentsHistory));
                    },
                  ),
                  AppElevatedButton(
                    buttonColor: AppColors.lightgrey,
                    textColor: AppColors.black,
                    text: 'Edit',
                    onPressed: () {},
                  ),
                  AppElevatedButton(
                    buttonColor: AppColors.lightgrey,
                    textColor: AppColors.black,
                    text: 'Delete',
                    onPressed: () {
                      context
                          .read<CreditBloc>()
                          .add(DeleteCreditEvent(creditModel: widget.credit));
                      context.router.push(const CreditsListRoute());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
