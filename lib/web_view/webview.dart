// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             body: WebViewLoad()
//         )
//     );
//   }
// }
//
// class WebViewLoad extends StatefulWidget {
//   WebViewLoadUI createState() => WebViewLoadUI();
// }
//
// class WebViewLoadUI extends State<WebViewLoad> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('WebView in Flutter')),
//         body: WebView(
//           initialUrl: 'https://google.com',
//           javascriptMode: JavascriptMode.unrestricted,
//         ));
//   }
// }