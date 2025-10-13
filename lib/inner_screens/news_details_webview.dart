import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/widget/vertical_spacing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/utils.dart';
import '../widget/drawer_widget.dart';

class NewsDetailsWebview extends StatefulWidget {
  const NewsDetailsWebview({super.key});

  @override
  State<NewsDetailsWebview> createState() => _NewsDetailsWebviewState();
}

class _NewsDetailsWebviewState extends State<NewsDetailsWebview> {
  late final WebViewController _webViewController;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(true)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            setState(() {
              _progress = progress / 100;
            });
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          "https://techcrunch.com/2022/06/17/marc-lores-food-delivery-startup-wonder-raises-350m-3-5b-valuation/",
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    // Size size = Utils(context).getScreenSize;
    final navigator = Navigator.of(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        if (await _webViewController.canGoBack()) {
          await _webViewController.goBack();
          return;
        } else {
          if (mounted) {
            navigator.pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              if (await _webViewController.canGoBack()) {
                _webViewController.goBack();
              } else {
                if (mounted) {
                  navigator.pop();
                }
              }
            },
            icon: const Icon(IconlyBold.arrowLeft2),
          ),
          iconTheme: IconThemeData(color: color),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'News app web view',
            style: GoogleFonts.lobster(
              textStyle: TextStyle(
                fontSize: 20,
                letterSpacing: 0.6,
                color: color,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _showModalSheetFct();
              },
              icon: const Icon(Icons.more_horiz),
            ),
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: _progress,
              color: _progress == 1.0 ? Colors.transparent : Colors.green,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            Expanded(child: WebViewWidget(controller: _webViewController)),
          ],
        ),
      ),
    );
  }

  Future<void> _showModalSheetFct() async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VerticalSpacing(20),
              Center(
                child: Container(
                  height: 5,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const VerticalSpacing(20),
              const Text(
                'More options',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Divider(thickness: 2),
              const VerticalSpacing(20),
              ListTiles(
                label: 'Share',
                function: () async {
                  try {
                    await SharePlus.instance.share(
                      ShareParams(text: 'url', subject: 'Look what I made'),
                    );
                  } catch (err) {
                    log(err.toString());
                  }
                },
                iconData: Icons.ios_share,
              ),
              ListTiles(
                label: 'Open in browser',
                function: () async {
                  if (!await launchUrl(Uri.parse('https://techcrunch.com/2022/06/17/marc-lores-food-delivery-startup-wonder-raises-350m-3-5b-valuation/'))) {
                  throw Exception('Could not launch');
                  }
                },
                iconData: Icons.link,
              ),
              ListTiles(
                label: 'Refresh',
                function: () {
                  try {
                    _webViewController.reload();
                  } catch (err) {
                    log('error');
                  } finally {
                    Navigator.pop(context);
                  }
                },
                iconData: Icons.refresh,
              ),
            ],
          ),
        );
      },
    );
  }
}
