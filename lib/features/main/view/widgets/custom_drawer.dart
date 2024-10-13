import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:make_qr/core/constants/translation.dart';

import 'privacy_policies_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: Text(Translation.privacyPolicy.tr()),
              onTap: () {
                Scaffold.of(context).closeDrawer();
                GoRouter.of(context)
                    .pushNamed(PrivacyPoliciesView.privacyPolicies);
              },
              trailing: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    ));
  }
}
