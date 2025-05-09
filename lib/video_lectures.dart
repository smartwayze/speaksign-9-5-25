import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoLecturesPage extends StatefulWidget {
  @override
  State<VideoLecturesPage> createState() => _VideoLecturesPageState();
}

class _VideoLecturesPageState extends State<VideoLecturesPage> {
  final TextEditingController _searchController = TextEditingController();
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(
          'https://m.youtube.com/results?search_query=deaf+people+sign+language'))
      ..setNavigationDelegate(
        NavigationDelegate(onPageFinished: (url) {
          _webViewController.runJavaScript('''
            // Hide YouTube top bar
            document.querySelector('header')?.style.display = 'none';
            document.querySelector('#masthead')?.style.display = 'none';
            document.querySelector('#search-form')?.style.display = 'none';
            document.querySelector('ytd-masthead')?.style.display = 'none';

            // Hide Shorts sections
            document.querySelectorAll('ytd-reel-shelf-renderer').forEach(el => el.style.display = 'none');
            document.querySelectorAll('ytd-shelf-renderer').forEach(el => {
              if (el.innerText.includes('Shorts')) {
                el.style.display = 'none';
              }
            });

            // Hide bottom navigation bar
            document.querySelector('ytd-app').shadowRoot.querySelector('ytd-mini-guide-renderer')?.style.display = 'none';
          ''');
        }),
      );
  }

  void _searchVideos() {
    final query = _searchController.text.toLowerCase();
    if (query.contains('deaf') ||
        query.contains('sign language') ||
        query.contains('hearing')) {
      final searchUrl = 'https://m.youtube.com/results?search_query=$query';
      _webViewController.loadRequest(Uri.parse(searchUrl));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Only deaf-related videos are allowed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deaf Learning Videos',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search lectures... (only deaf-related)',
                prefixIcon: const Icon(Icons.search, color: Colors.purple),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.purple),
                  onPressed: _searchVideos,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                filled: true,
              ),
              onSubmitted: (value) => _searchVideos(),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: WebViewWidget(controller: _webViewController),
            ),
          ),
        ],
      ),
    );
  }
}
