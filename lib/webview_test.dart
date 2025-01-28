import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  const WebViewContainer({super.key});

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
//initialize webview et donner accès a internet sur ios

  final controller = WebViewController(
    onPermissionRequest: (WebViewPermissionRequest request) => request.grant(),
  )
    ..clearCache()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setUserAgent("random")
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(
      Uri.parse('https://essilorinstrument.themitcompany.com/essishop/'),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Flutter Simple Example')),
        body: WebViewWidget(controller: controller));
  }
}
