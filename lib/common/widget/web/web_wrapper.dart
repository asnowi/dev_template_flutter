import 'dart:async';
import 'dart:io';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebWrapper extends StatefulWidget {
  WebWrapper(this.url,this.isLoading,{Key? key}) : super(key: key);

  final String url;

  bool isLoading = true;


  final Completer<WebViewController> webViewController = Completer<WebViewController>();



  @override
  State<WebWrapper> createState() => _WebWrapperState();
}

class _WebWrapperState extends State<WebWrapper> {

  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          child: WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted, // 开启 js
            onWebViewCreated: (WebViewController webViewController) {
              widget.webViewController.complete(webViewController);
            },
            onProgress: (int progress) {
              LogUtils.GGQ('----WebView---->>${progress}');
            },
            onPageStarted: (String url) {
              setState(() {
                _isVisible = true;
              });
            },
            onPageFinished: (String url) {
             setState(() {
               _isVisible = false;
             });
            },
          ),
        ),
        if(widget.isLoading) Visibility(
          visible: _isVisible,
          child: Container(
            margin: const EdgeInsets.only(top: 1.0),
            child: const LinearProgressIndicator(
              minHeight: 2.0,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
        )
      ],
    );
  }
}

