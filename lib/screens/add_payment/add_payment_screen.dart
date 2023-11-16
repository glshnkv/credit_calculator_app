import 'package:auto_route/auto_route.dart';
import 'package:credit_calculator_app/models/credit_model.dart';
import 'package:credit_calculator_app/router/router.dart';
import 'package:credit_calculator_app/theme/colors.dart';
import 'package:credit_calculator_app/widgets/app_elevated_button.dart';
import 'package:credit_calculator_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddPaymentScreen extends StatefulWidget {
  final CreditModel creditModel;

  const AddPaymentScreen({super.key, required this.creditModel});

  @override
  State<AddPaymentScreen> createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  late TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Add payment'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: AppColors.grey),
              hintText: "Amount",
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AppElevatedButton(
        text: 'Add payment',
        buttonColor: AppColors.red,
        textColor: AppColors.white,
        onPressed: () {
          context.router.push(const CreditsListRoute());
        },
      ),
    );
  }
}
