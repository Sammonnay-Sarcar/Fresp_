import 'package:flutter/material.dart';
import 'package:fresp/features/auth/services/auth_service.dart';
import 'package:fresp/features/user/widgets/accout_button.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    void logOut() {
      authService.logOutUser(context);
    }

    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'Your Orders', onTap: () {}),
            AccountButton(text: 'Log Out', onTap: logOut),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
