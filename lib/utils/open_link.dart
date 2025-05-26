import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchedScannerUrl(String url, BuildContext context) async {
  final uri = Uri.tryParse(url);

  if (uri != null && await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    ScaffoldMessenger.of(
      // ignore: use_build_context_synchronously
      context,
    ).showSnackBar(SnackBar(content: Text('Invalid or unlaunchable URL')));
  }
}
