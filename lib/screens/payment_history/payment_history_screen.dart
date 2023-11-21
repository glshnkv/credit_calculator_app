import 'package:auto_route/auto_route.dart';
import 'package:credit_calculator_app/models/payment_model.dart';
import 'package:credit_calculator_app/theme/colors.dart';
import 'package:credit_calculator_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


@RoutePage()
class PaymentHistoryScreen extends StatefulWidget {
  final List<PaymentModel> list;

  const PaymentHistoryScreen({super.key, required this.list});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'History',
        onTap: () {
          context.router.pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            border:
            Border.all(width: 2, color: AppColors.lightgrey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.separated(
            itemCount: widget.list.length,
            itemBuilder: (BuildContext context, int index) {
              final payment = widget.list[index];
              return Padding(
                padding: EdgeInsets.all(15),
                child: ListTile(
                  title: Text('\$${payment.amount.toString()}', style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(payment.date.toString()),
                  trailing: Container(
                    child: SvgPicture.asset(
                      'assets/images/icons/home.svg',
                    ),
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: const Divider(height: 6, color: AppColors.grey),
                ),
          ),
        ),
      ),
    );
  }
}
