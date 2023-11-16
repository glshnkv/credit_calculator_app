import 'package:auto_route/auto_route.dart';
import 'package:credit_calculator_app/router/router.dart';
import 'package:credit_calculator_app/screens/onboarding/widgets/onboarding_page_widget.dart';
import 'package:credit_calculator_app/theme/colors.dart';
import 'package:credit_calculator_app/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          controller: controller,
          children: [
            OnboardingPageWidget(
              urlImage: 'assets/images/onboarding_images/onboarding-1.png',
              title: 'Calculate Your Credit',
              subtitle:
                  'Input your credit amount, interest rate, and loan term to instantly calculate your monthly payments. This is a valuable tool for managing your finances.',
            ),
            OnboardingPageWidget(
              urlImage: 'assets/images/onboarding_images/onboarding-2.png',
              title: 'We value your feedback',
              subtitle:
                  'Every day we are getting better due to your ratings and reviews — that helps us protect your accounts.',
            ),
            OnboardingPageWidget(
              urlImage: 'assets/images/onboarding_images/onboarding-3.png',
              title: 'Compare Loan Options',
              subtitle:
                  'Explore different credit scenarios to find the one that aligns with your financial goals. Compare various loan amounts, interest rates, and terms.',
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: AppColors.black,
        height: 150,
        child: Column(
          children: [
            Center(
              child: isLastPage
                  ? AppElevatedButton(
                      buttonColor: AppColors.red,
                      textColor: AppColors.white,
                      text: 'Get Started',
                      onPressed: () {
                        context.router.push(const CreditsListRoute());
                      },
                    )
                  : AppElevatedButton(
                      buttonColor: AppColors.red,
                      textColor: AppColors.white,
                      text: 'Continue',
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                    ),
            ),
            SizedBox(height: 10),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.red,
                dotColor: AppColors.grey,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text('Terms of Use',
                        style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w400))),
                Text('|',
                    style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
                TextButton(
                    onPressed: () {},
                    child: Text('Privacy Policy',
                        style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w400))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
