import 'package:pdf/widgets.dart' as pw;
import 'package:rasid_task/features/pdf/view/widgets/label_container.dart';

pw.Widget buildEducation(pw.Font emoji , font,
    {required title, required major, required faculty, required info}) {
  return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
    buildContainer(title , font),
    pw.SizedBox(height: 8),
    pw.Row(children: [
      pw.Text(major),
      pw.Spacer(),
      pw.Text(info),
    ]),
    pw.Text(faculty),
  ]);
}