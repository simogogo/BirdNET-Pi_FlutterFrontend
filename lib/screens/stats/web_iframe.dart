// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;
import 'package:flutter/material.dart';

/// Set of already-registered viewType identifiers.
/// Prevents calling registerViewFactory more than once per viewType,
/// which would throw on some Flutter Web versions.
final _registered = <String>{};

Widget buildIframe(BuildContext context, String url) {
  // Use a unique viewType for each URL to avoid collisions
  final viewType = 'iframe-${url.hashCode}';

  // Register the view factory only once per viewType
  if (!_registered.contains(viewType)) {
    _registered.add(viewType);

    ui_web.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
      // Create a wrapper div that handles iOS Safari scrolling
      final wrapper = html.DivElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.overflow = 'auto'
        // iOS Safari: enable momentum scrolling inside the container
        ..style.setProperty('-webkit-overflow-scrolling', 'touch');

      final iframe = html.IFrameElement()
        ..src = url
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        // iOS Safari: allow scrolling within the iframe
        ..setAttribute('scrolling', 'yes')
        // Allow scripts + same-origin so embedded pages work on iOS Safari
        ..setAttribute(
          'sandbox',
          'allow-scripts allow-same-origin allow-popups allow-forms',
        )
        // Feature policy for iOS Safari
        ..setAttribute('allow', 'autoplay; fullscreen; microphone');

      wrapper.append(iframe);
      return wrapper;
    });
  }

  // Return the HtmlElementView
  return HtmlElementView(viewType: viewType);
}

void setIframesInteractable(bool interactable) {
  final iframes = html.document.querySelectorAll('iframe');
  for (final element in iframes) {
    if (element is html.IFrameElement) {
      element.style.pointerEvents = interactable ? 'auto' : 'none';
    }
  }
}
