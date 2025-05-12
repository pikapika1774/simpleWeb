import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = WebviewController();
  final _urlController = TextEditingController(text: 'https://www.google.com');
  bool _isWebViewReady = false;

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  Future<void> _initWebView() async {
    await _controller.initialize();
    await _controller.loadUrl(_urlController.text);

    // URLの変更を監視し、テキストフィールドに反映
    _controller.url.listen((url) {
      if (url.isNotEmpty) {
        _urlController.text = url;
      }
    });

    setState(() {
      _isWebViewReady = true;
    });
  }

  void _navigateToUrl() {
    final input = _urlController.text.trim();
    if (input.isEmpty) return;

    final url =
        input.startsWith('http')
            ? input
            : 'https://www.google.com/search?q=${Uri.encodeComponent(input)}';

    _controller.loadUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebView Windows',
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: _urlController,
                    onSubmitted: (_) => _navigateToUrl(),
                    decoration: const InputDecoration(
                      hintText: 'Enter URL or search word',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: _navigateToUrl,
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => _controller.goBack(),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () => _controller.goForward(),
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => _controller.reload(),
            ),
          ],
        ),
        body:
            _isWebViewReady
                ? Webview(_controller)
                : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
