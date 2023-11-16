import 'package:auto_route/auto_route.dart';
import 'package:credit_calculator_app/repository/credit_repository.dart';
import 'package:credit_calculator_app/router/router.dart';
import 'package:credit_calculator_app/screens/credit_info/credit_info_screen.dart';
import 'package:credit_calculator_app/screens/credits_list/bloc/credits_list_bloc.dart';
import 'package:credit_calculator_app/screens/credits_list/widgets/credit_list_tile_widget.dart';
import 'package:credit_calculator_app/theme/colors.dart';
import 'package:credit_calculator_app/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CreditsListScreen extends StatefulWidget {
  const CreditsListScreen({super.key});

  @override
  State<CreditsListScreen> createState() => _CreditsListScreenState();
}

class _CreditsListScreenState extends State<CreditsListScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CreditsListBloc>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Credit calculator',
          style: TextStyle(
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          GestureDetector(
            child: SvgPicture.asset('assets/images/icons/Setting.svg'),
            onTap: () {
              context.router.push(const SettingsRoute());
            },
          ),
          SizedBox(
            width: 15,
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: BlocProvider<CreditsListBloc>(
        create: (context) => bloc,
        child: BlocConsumer<CreditsListBloc, CreditsListState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if (state is LoadedCreditsListState &&
                state.creditList.length != 0) {
              final _creditList = state.creditList;

              return ListView.builder(
                itemCount: _creditList.length,
                itemBuilder: (BuildContext context, int index) {
                  final credit = _creditList[index];
                  return CreditListTileWidget(
                    paid: credit.paid,
                    totalPayments: credit.totalPayments,
                    onTap: () {
                      context.router.push(CreditInfoRoute(credit: credit));
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Column(
                    children: [
                      Text(
                        'It\'s empty',
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Add information about your mortgage by clicking the "Add credit info" button',
                        style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AppElevatedButton(
        text: 'Add credit info',
        buttonColor: AppColors.red,
        textColor: AppColors.white,
        onPressed: () {
          context.router.push(const AppCreditRoute());
        },
      ),
    );
  }
}
