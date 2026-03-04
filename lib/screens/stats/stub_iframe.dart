import 'package:flutter/material.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';

Widget buildIframe(BuildContext context, String url) {
  return Center(child: Text(AppLocalizations.of(context)!.iframeNotSupported));
}

void setIframesInteractable(bool interactable) {
  // No-op per lo stub
}
