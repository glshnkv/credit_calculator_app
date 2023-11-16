import 'package:auto_route/auto_route.dart';
import 'package:credit_calculator_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final String title;

  const AppBarWidget({super.key, required this.title})
      : preferredSize = const Size.fromHeight(58.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        title,
        style: const TextStyle(
            color: AppColors.black, fontSize: 17, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.5,
    );
  }
}
