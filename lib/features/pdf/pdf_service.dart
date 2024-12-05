import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:rasid_task/features/pdf/view/widgets/ar.dart';
import 'package:rasid_task/features/pdf/view/widgets/en.dart';
import 'package:rasid_task/features/pdf/view/widgets/header.dart';

class PdfService with ChangeNotifier {
  final pdf = pw.Document();
 late File file;

  Future<void> generatePortfolioPDF() async {
    try {
      // Define fonts
      final englishFont = await PdfGoogleFonts.openSansRegular();
      final arabicFont = await PdfGoogleFonts.amiriRegular();
      final emoji = await PdfGoogleFonts.notoColorEmoji();
      final fallbackFont = await PdfGoogleFonts.notoNaskhArabicRegular();

      // Add content
      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          theme: pw.ThemeData(
            defaultTextStyle: pw.TextStyle(font: arabicFont),
          ),
          header: (context) => buildHeader(emoji),
          footer: (context) => pw.Text(
            'Page ${context.pageNumber} of ${context.pagesCount}',
            style: pw.TextStyle(fontSize: 14, font: arabicFont),
          ),
          build: (context) => [
            // English Section
            englishSection(emoji, englishFont),
            pw.NewPage(),
            arabicSection(emoji, fallbackFont),
          ],
        ),
      );

      // Save locally
      final output = await getTemporaryDirectory();
      file = File("${output.path}/portfolio.pdf");
      await file.writeAsBytes(await pdf.save());

      notifyListeners(); // Notify listeners about changes
    } catch (e) {
      debugPrint('Error generating PDF: $e');
    }
  }

  Future<void> printPDF() async {
      await OpenFilex.open(file.path);
  }

  Future<void> sharePDF() async {

      await Printing.sharePdf(
        bytes: file.readAsBytesSync(),
        filename: 'portfolio.pdf',
      );
  }
}