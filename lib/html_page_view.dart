import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HTMLPAGE extends StatefulWidget {
  const HTMLPAGE({super.key});

  @override
  State<HTMLPAGE> createState() => _HTMLPAGEState();
}

class _HTMLPAGEState extends State<HTMLPAGE> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      javaScriptEnabled: true,
      applicationNameForUserAgent: "essishop_app",
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      userAgent:
          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36",
      allowFileAccess: true,
      iframeAllowFullscreen: true);

  String url = "https://essilorinstrument.themitcompany.com/essishop/";
  final urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InAppWebView(
        key: webViewKey,

        //webViewEnvironment: webViewEnvironment,
        initialUrlRequest: URLRequest(
          url: WebUri(
            "https://essilorinstrument.themitcompany.com/essishop/",
          ),
        ),
        initialSettings: settings,

        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {
          setState(() {
            this.url = url.toString();
            urlController.text = this.url;
          });
        },
        onPermissionRequest: (controller, request) async {
          return PermissionResponse(
              resources: request.resources,
              action: PermissionResponseAction.GRANT);
        },
      ),
    );
  }
}
