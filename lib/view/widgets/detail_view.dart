import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class DetailViewScreen extends StatefulWidget {
    String newsurl;
   DetailViewScreen({super.key, required this.newsurl}
   );

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}
class _DetailViewScreenState extends State<DetailViewScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      widget.newsurl=widget.newsurl.contains("http:")
      ? widget.newsurl.replaceAll("http:", "https:")
      : widget.newsurl;
    });
  }
  final Completer<WebViewController> controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Smart News")),
      body: WebView(
        initialUrl: widget.newsurl,
        javascriptMode: JavascriptMode.unrestricted,
       onWebViewCreated: (WebViewController webViewController){  
         setState(() {
            controller.complete(webViewController);
          });
        }
      ),);
  }
}