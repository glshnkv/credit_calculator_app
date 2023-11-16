import 'package:credit_calculator_app/theme/colors.dart';
import 'package:flutter/material.dart';

class OnboardingPageWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final String urlImage;

  const OnboardingPageWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.urlImage});

  @override
  State<OnboardingPageWidget> createState() => _OnboardingPageWidgetState();
}

class _OnboardingPageWidgetState extends State<OnboardingPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.black,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                widget.urlImage,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Positioned.fill(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.transparent, AppColors.black],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Container(

            padding: EdgeInsets.all(33),
            color: AppColors.black,
            child: Center(
              child: Column(
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 15),
                  Text(
                    widget.subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
