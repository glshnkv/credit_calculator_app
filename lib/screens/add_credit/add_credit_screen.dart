import 'package:auto_route/auto_route.dart';
import 'package:credit_calculator_app/models/credit_model.dart';
import 'package:credit_calculator_app/repository/credit_repository.dart';
import 'package:credit_calculator_app/router/router.dart';
import 'package:credit_calculator_app/screens/credit_bloc/credit_bloc.dart';
import 'package:credit_calculator_app/theme/colors.dart';
import 'package:credit_calculator_app/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

@RoutePage()
class AppCreditScreen extends StatefulWidget {
  const AppCreditScreen({super.key});

  @override
  State<AppCreditScreen> createState() => _AppCreditScreenState();
}

class _AppCreditScreenState extends State<AppCreditScreen> {
  late TextEditingController creditAmountController = TextEditingController();
  late TextEditingController interestRateController = TextEditingController();
  late TextEditingController creditPeriodController = TextEditingController();
  late TextEditingController dateController = TextEditingController();

  late double totalPayments = 0;
  late double monthlyPayment = 0;
  late double fullCost = 0;
  late double overpayment = 0;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<CreditBloc, CreditState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.grey,
                ),
                onTap: () {
                  context.router.pop();
                },
              ),
              title: Text(
                'Add credit',
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.5,
              actions: [
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        'Save',
                        style: const TextStyle(
                            color: AppColors.red,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  onTap: () {
                    CreditModel _creditModel = CreditModel(
                      id: DateTime.now().millisecondsSinceEpoch,
                      paid: 0,
                      creditAmount: int.parse(creditAmountController.text),
                      interestRate: int.parse(interestRateController.text),
                      creditPeriod: int.parse(creditPeriodController.text),
                      date: dateController.text,
                      totalPayments: totalPayments.round(),
                      monthlyPayment: monthlyPayment.round(),
                      fullCost: fullCost.round(),
                      overpayment: overpayment.round(),
                      paymentsHistory: [],
                    );
                    context
                        .read<CreditBloc>()
                        .add(AddingCreditEvent(creditModel: _creditModel));
                    context.router.push(CreditsListRoute());
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: AppColors.lightgrey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              child: SvgPicture.asset(
                                'assets/images/icons/car.svg',
                              ),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            title: Text(
                              'Vehcle',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            leading: Container(
                              child: SvgPicture.asset(
                                  'assets/images/icons/percentage-circle.svg'),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            title: Text(
                              'Personal',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            leading: Container(
                              child: SvgPicture.asset(
                                  'assets/images/icons/home.svg'),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            title: Text(
                              'Home',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextField(
                          controller: creditAmountController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColors.grey),
                            hintText: "Credit amount",
                          ),
                        ),
                        TextField(
                          controller: interestRateController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColors.grey),
                            hintText: "Interest rate",
                          ),
                        ),
                        TextField(
                          controller: creditPeriodController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColors.grey),
                            hintText: "Credit period",
                          ),
                        ),
                        TextField(
                          controller: dateController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColors.grey),
                            hintText: "Date",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppElevatedButton(
                    text: 'Calculate',
                    textColor: AppColors.white,
                    buttonColor: AppColors.red,
                    onPressed: () {
                      setState(() {
                        int _creditAmount =
                            int.parse(creditAmountController.text);
                        int _interestRate =
                            int.parse(interestRateController.text);
                        int _creditPeriod =
                            int.parse(creditPeriodController.text);

                        fullCost = _creditAmount * _interestRate / 100 * _creditPeriod;
                        totalPayments = _creditAmount + fullCost;
                        monthlyPayment = totalPayments / _creditPeriod;
                        overpayment =
                            _creditAmount * _interestRate / 100 * _creditPeriod;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GridView.count(
                    childAspectRatio: ((MediaQuery.of(context).size.height -
                                kToolbarHeight -
                                24) /
                            2) /
                        (MediaQuery.of(context).size.width / 2),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: AppColors.lightgrey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total payments',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${totalPayments.round().toString()}\$',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: AppColors.lightgrey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Monthly payment',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${monthlyPayment.round().toString()}\$',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: AppColors.lightgrey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Full cost of credit',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${fullCost.round().toString()}\$',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: AppColors.lightgrey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Overpayment',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${overpayment.round().toString()}\$',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
