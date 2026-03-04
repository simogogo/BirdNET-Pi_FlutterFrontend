import 'package:flutter/material.dart';
import 'stub_iframe.dart' if (dart.library.html) 'web_iframe.dart';

// Export per disabilitare o riabilitare tutti gli iframe
export 'stub_iframe.dart'
    if (dart.library.html) 'web_iframe.dart'
    show setIframesInteractable;

class IframeWidget extends StatelessWidget {
  final String url;

  const IframeWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return buildIframe(context, url);
  }
}
