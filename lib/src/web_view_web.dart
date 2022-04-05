import 'package:flutter/material.dart';

import 'platforms/base.dart';
import 'platforms/web.dart';
import 'web_view_base.dart';

class EasyWebView extends EasyWebViewBase {
  const EasyWebView({
    Key? key,
    required String src,
    double? height,
    double? width,
    void Function()? onLoaded,
    bool isMarkdown = false,
    bool convertToMarkdown = false,
    bool convertToWidgets = false,
    WidgetBuilder? fallbackBuilder,
    WebViewOptions options = const WebViewOptions(),
  }) : super(
          key: key,
          src: src,
          height: height,
          width: width,
          onLoaded: onLoaded,
          isMarkdown: isMarkdown,
          convertToMarkdown: convertToMarkdown,
          convertToWidgets: convertToWidgets,
          fallbackBuilder: fallbackBuilder,
          options: options,
        );

  @override
  Widget build(BuildContext context) {
    if (!canBuild()) {
      return BrowserWebView(
        key: key,
        src: src,
        width: width,
        height: height,
        onLoaded: onLoaded,
        options: options,
      );
    }
    return super.build(context);
  }
}
