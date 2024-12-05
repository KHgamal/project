import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:rasid_task/core/colors.dart';

pw.Widget buildContainer(String text , font) {
  return pw.Container(
    padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 5),
    decoration: pw.BoxDecoration(
      color:AllColors.tealPdf,
      borderRadius: pw.BorderRadius.circular(8),
    ),
    child: pw.Text(text,
        style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold , font: font ,
        color: PdfColor.fromHex('#ffffff')  )),
  );
}