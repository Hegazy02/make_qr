import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:make_qr/core/constants/translation.dart';

class PrivacyPoliciesView extends StatelessWidget {
  const PrivacyPoliciesView({super.key});
  static const privacyPolicies = '/privacy_policies_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Translation.privacyPolicy.tr())),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: HtmlWidget('''
              <p><strong>Privacy Policy</strong></p>
              <p><strong>Introduction</strong></p>
              <p>Welcome to <strong>Make Qr</strong>. We respect your privacy and are committed to protecting your personal data. This privacy policy will inform you about how we look after your personal data when you use our mobile application and tell you about your privacy rights and how the law protects you.</p>
              <p><strong>1. Information We Collect</strong></p>
              <ul>
              <li><strong>Camera Access</strong>: We require access to your device&rsquo;s camera to scan QR codes.</li>
              <li><strong>Storage Access</strong>: We need access to your device&rsquo;s storage to save and upload images and files.</li>
              <li><strong>Generated QR Codes</strong>: We generate QR codes from URLs and other data you provide.</li>
              <li><strong>Uploaded Files</strong>: We upload images and files to our server to generate URLs and corresponding QR codes.</li>
              <li><strong>Cached Data</strong>: We cache some data to display it to you offline.</li>
              </ul>
              <p><strong>2. How We Use Your Information</strong></p>
              <ul>
              <li><strong>Scanning QR Codes</strong>: To scan and interpret QR codes using your device&rsquo;s camera.</li>
              <li><strong>Generating QR Codes</strong>: To create QR codes from URLs and other data you input.</li>
              <li><strong>Uploading Files</strong>: To upload images and files to our server to generate URLs and QR codes.</li>
              <li><strong>Sharing QR Codes</strong>: To share generated QR codes with other applications on your device.</li>
              <li><strong>Offline Access</strong>: To provide you with access to certain data even when you are offline.</li>
              </ul>
              <p><strong>3. Data Sharing and Disclosure</strong></p>
              <p>We do not share your personal data with third parties except as necessary to provide our services, comply with the law, or protect our rights.</p>
              <p><strong>4. Data Security</strong></p>
              <p>We implement appropriate security measures to protect your data from unauthorized access, alteration, disclosure, or destruction.</p>
              <p><strong>5. Your Data Protection Rights</strong></p>
              <p>You have the right to access, correct, or delete your personal data. If you wish to exercise these rights, please contact us at AbdelrhmanHegazy02@gmail.com.</p>
              <p><strong>6. Changes to This Privacy Policy</strong></p>
              <p>We may update this privacy policy from time to time. We will notify you of any changes by posting the new privacy policy on this page.</p>
              <p><strong>7. Contact Us</strong></p>
              <p>If you have any questions about this privacy policy, please contact us at AbdelrhmanHegazy02@gmail.com.</p>
                      '''),
            ),
          ),
        ),
      ),
    );
  }
}
