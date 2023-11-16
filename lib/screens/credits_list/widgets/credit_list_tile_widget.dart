import 'package:credit_calculator_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CreditListTileWidget extends StatelessWidget {
  final int paid;
  final int totalPayments;
  final void Function()? onTap;

  const CreditListTileWidget({
    super.key,
    required this.paid,
    required this.totalPayments,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final num percentage = num.parse((paid / totalPayments).toStringAsFixed(2));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: AppColors.lightgrey),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: SvgPicture.asset(
                      'assets/images/icons/percentage-circle.svg'),
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 86,
                            child: Text(
                              'My credit',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                              alignment: Alignment.centerRight,
                              width: 150,
                              child: Text(
                                'Paid ${paid}\$ out of ${totalPayments}\$',
                                style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      ),
                      LinearPercentIndicator(
                        width: 270,
                        lineHeight: 5.0,
                        percent: percentage.toDouble(),
                        progressColor: AppColors.green,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
