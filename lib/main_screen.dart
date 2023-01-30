import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('main'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: 'https://google.com',
                child: Text('구글'),
              ),
              PopupMenuItem<String>(
                value: 'https://naver.com',
                child: Text('네이버'),
              ),
              PopupMenuItem<String>(
                value: 'https://kakao.com',
                child: Text('카카오'),
              ),
            ],
          ),
        ],
      ),
      body: WebView(
        initialUrl: 'https://flutter.dev',
      ),
    );
  }
}
