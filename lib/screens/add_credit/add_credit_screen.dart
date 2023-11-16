import 'package:auto_route/auto_route.dart';
import 'package:credit_calculator_app/models/credit_model.dart';
import 'package:credit_calculator_app/repository/credit_repository.dart';
import 'package:credit_calculator_app/router/router.dart';
import 'package:credit_calculator_app/screens/add_credit/bloc/add_credit_bloc.dart';
import 'package:credit_calculator_app/theme/colors.dart';
import 'package:credit_calculator_app/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

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

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddCreditBloc>();

    return BlocProvider<AddCreditBloc>(
      create: (_) => bloc,
      child: BlocConsumer<AddCreditBloc, AddCreditState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CalculatedDataState) {
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
                        paid: 0,
                        creditAmount: int.parse(creditAmountController.text),
                        interestRate: int.parse(interestRateController.text),
                        creditPeriod: int.parse(creditPeriodController.text),
                        date: dateController.text,
                        totalPayments: state.totalPayments,
                        monthlyPayment: state.monthlyPayment,
                        fullCost: state.fullCost,
                        overpayment: state.overpayment,
                      );
                      context.read<AddCreditBloc>().add(AddingCreditEvent(creditModel: _creditModel));
                      context.router.push(CreditsListRoute());
                    },
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppElevatedButton(
                      text: 'Calculate',
                      textColor: AppColors.white,
                      buttonColor: AppColors.red,
                      onPressed: () {
                        context.read<AddCreditBloc>().add(
                              CalculateDataEvent(
                                creditAmount:
                                    int.parse(creditAmountController.text),
                                interestRate:
                                    int.parse(interestRateController.text),
                                creditPeriod:
                                    int.parse(creditPeriodController.text),
                              ),
                            );
                      },
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 160,
                          child: Column(
                            children: [
                              Text(
                                'Total payments',
                                style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                state.totalPayments.toString(),
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 160,
                          child: Column(
                            children: [
                              Text(
                                'Monthly payment',
                                style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                state.monthlyPayment.toString(),
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 160,
                          child: Column(
                            children: [
                              Text(
                                'Full cost of credit',
                                style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                state.fullCost.toString(),
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 160,
                          child: Column(
                            children: [
                              Text(
                                'Overpayment',
                                style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                state.overpayment.toString(),
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
          } else {
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
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Firstly, calculate your credit!')));
                    },
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppElevatedButton(
                      text: 'Calculate',
                      textColor: AppColors.white,
                      buttonColor: AppColors.red,
                      onPressed: () {
                        context.read<AddCreditBloc>().add(
                              CalculateDataEvent(
                                creditAmount:
                                    int.parse(creditAmountController.text),
                                interestRate:
                                    int.parse(interestRateController.text),
                                creditPeriod:
                                    int.parse(creditPeriodController.text),
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
