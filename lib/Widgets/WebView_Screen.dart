import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Colors.dart';

class WebViewScreen extends StatefulWidget {
  static const routName = '/web-screen';
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final url = ModalRoute.of(context)!.settings.arguments as String;
    return WebviewScaffold(
      appBar: AppBar(
        title: Text("MegaLink",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      url: url,
      withZoom: true,
      clearCache: true,
      scrollBar: true,
      initialChild: Center(
        child: CircularProgressIndicator(
          color: ColorPrimary,
        ),
      ),
    );
  }
}
