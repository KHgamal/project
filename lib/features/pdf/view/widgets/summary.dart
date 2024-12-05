import 'package:pdf/widgets.dart' as pw;
import 'package:rasid_task/features/pdf/view/widgets/label_container.dart';

pw.Widget buildSummary(font ,{required title, required desc}  ) {
  return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
    buildContainer(title, font ),
    pw.SizedBox(height: 8),
    pw.Paragraph(text: desc , style: pw.TextStyle(font:font )),
    pw.SizedBox(height: 8),
  ]);
}