import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class PdfController extends GetxController {
  Future<void> printPdf() async {
    final pdfData = await rootBundle.load('assets/invoice.pdf');
    print('PDF: $pdfData');

    if (pdfData != null) {
      await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async =>
              pdfData.buffer.asUint8List());
    } else {
      print('Failed to load PDF data');
    }
  }
}
