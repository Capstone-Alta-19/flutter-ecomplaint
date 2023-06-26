import 'package:complainz/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
  final String link;

  const Webview({super.key, required this.link});
  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColors.secondary100)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            CircularProgressIndicator();
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            const Text("Ada kesalahan");
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.link));

    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
