import 'package:pdf/widgets.dart' as pw;
import 'package:rasid_task/features/pdf/view/widgets/label_container.dart';

pw.Widget buildWorkHistory(pw.Font emoji,  font,
    {required title,
    required desc,
    required role,
    required company,
    required info} ) {
  return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
    buildContainer(title , font),
    pw.SizedBox(height: 8),
    pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceAround, children: [
      pw.Text(role, style: pw.TextStyle(fontWeight: pw.FontWeight.bold , font :font)),
      pw.Text(company, style: pw.TextStyle(fontWeight: pw.FontWeight.bold , font :font)),
      pw.Text(info, style: pw.TextStyle(fontWeight: pw.FontWeight.bold , font :font)),
    ]),
    pw.SizedBox(height: 5),
    pw.Paragraph(
        text: desc,
        style: pw.TextStyle(
          fontFallback: [emoji],
        )),
  ]);
}