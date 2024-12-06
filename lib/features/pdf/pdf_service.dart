import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:rasid_task/features/pdf/view/widgets/ar.dart';
import 'package:rasid_task/features/pdf/view/widgets/en.dart';
import 'package:rasid_task/features/pdf/view/widgets/header.dart';

class PdfService  {
 static final pdf = pw.Document();
 static late File file;

 static Future<void> generatePortfolioPDF() async {
    try {
      // Define fonts
      final arabicFont =  pw.Font.ttf(
        await rootBundle.load('assets/fonts/Amiri-Regular.ttf'),
      );
      final emoji = pw.Font.ttf(
        await rootBundle.load('assets/fonts/NotoEmoji-Regular.ttf'),
      );

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
            englishSection(emoji, arabicFont),
            pw.NewPage(),
            arabicSection(emoji, arabicFont),
          ],
        ),
      );

      // Save locally
      final output = await getTemporaryDirectory();
      file = File("${output.path}/portfolio.pdf");
      await file.writeAsBytes(await pdf.save());
    } catch (e) {
      debugPrint('Error generating PDF: $e');
    }
  }

 static Future<void> printPDF() async {
      await OpenFilex.open(file.path);
  }

static  Future<void> sharePDF() async {

      await Printing.sharePdf(
        bytes: file.readAsBytesSync(),
        filename: 'portfolio.pdf',
      );
  }
}