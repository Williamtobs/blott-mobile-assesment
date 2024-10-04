import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

@RoutePage()
class WebViewPage extends StatelessWidget {
  const WebViewPage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          // url: Uri.parse('www.google.com'),
          url: Uri.parse(url),
        ),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            applicationNameForUserAgent: 'Flutter;Webview',
            javaScriptEnabled: true,
            useShouldOverrideUrlLoading: true,
            useOnLoadResource: true,
            javaScriptCanOpenWindowsAutomatically: true,
            useShouldInterceptAjaxRequest: true,
            useShouldInterceptFetchRequest: true,
          ),
        ),
      ),
    );
  }
}
