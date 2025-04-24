import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.url});
  final String url;
  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;
  var isLoading = 0;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            isLoading = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            isLoading = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            isLoading = 100;
          });
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(
              'Details',
              style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.reload();
            },
          )
        ],
      ),
      body: Stack(children: [
        WebViewWidget(
          controller: controller,
        ),
        isLoading < 100
            ? const LinearProgressIndicator(
                color: Colors.yellow,
              )
            : Container(),
      ]),
    );
  }
}
