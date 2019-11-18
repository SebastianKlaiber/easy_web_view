import 'package:easy_web_view/src/impl.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EasyWebView extends StatefulWidget implements EasyWebViewImpl {
  const EasyWebView({
    Key key,
    @required this.src,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  _EasyWebViewState createState() => _EasyWebViewState();

  @override
  final num height;

  @override
  final String src;

  @override
  final num width;
}

class _EasyWebViewState extends State<EasyWebView> {
  WebViewController _controller;

  @override
  void didUpdateWidget(EasyWebView oldWidget) {
    if (oldWidget.src != widget.src) {
      _controller.loadUrl(widget.src);
    }
    if (oldWidget.height != widget.height) {
      if (mounted) setState(() {});
    }
    if (oldWidget.width != widget.width) {
      if (mounted) setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return OptionalSizedChild(
      width: widget?.width,
      height: widget?.height,
      builder: (w, h) => WebView(
        initialUrl: widget.src,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
    );
  }
}
