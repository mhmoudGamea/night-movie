import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowWebView extends StatefulWidget {
  final String url;
  const ShowWebView({super.key, required this.url});

  @override
  State<ShowWebView> createState() => _ShowWebViewState();
}

class _ShowWebViewState extends State<ShowWebView> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.url);
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
