import 'package:auto_route/auto_route.dart';
import 'package:credit_calculator_app/theme/colors.dart';
import 'package:credit_calculator_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            ListTile(
              leading: SvgPicture.asset('assets/images/icons/notification-bing.svg'),
              title: Text('Set reminders', style: const TextStyle(
                  color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w400),),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset('assets/images/icons/security-safe.svg'),
              title: Text('Privacy Policy', style: const TextStyle(
                  color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w400),),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset('assets/images/icons/document.svg'),
              title: Text('Terms of Use', style: const TextStyle(
                  color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w400),),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset('assets/images/icons/ticket.svg'),
              title: Text('Subscription Information', style: const TextStyle(
                  color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w400),),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset('assets/images/icons/star.svg'),
              title: Text('Rate our app in the AppStore', style: const TextStyle(
                  color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w400),),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
