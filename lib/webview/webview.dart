import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WebView extends StatelessWidget {
  final String url;
  WebView(
    this.url,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: WebView(url));
  }
}
