import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfUrlViewer extends StatelessWidget {
  final String url;
  static const String pdf = '/pdfUrlViewer';

  const PdfUrlViewer({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SfPdfViewer.network(
        url,
        canShowHyperlinkDialog: true,
        canShowPageLoadingIndicator: true,
      ),
    ));
  }
}
