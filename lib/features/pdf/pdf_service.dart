import 'dart:io';
import 'package:open_filex/open_filex.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';

class PdfService {
  static final pdf = pw.Document();
  
  static late File file;
  static Future<File> generatePortfolioPDF() async {
    // Define fonts
   // final arabicFont = await PdfGoogleFonts.amiriRegular();
    final englishFont = await PdfGoogleFonts.openSansRegular();
    final arabicFont = await PdfGoogleFonts.amiriRegular();
    final emoji = await PdfGoogleFonts.notoColorEmoji();
    final fallbackFont = await PdfGoogleFonts.notoNaskhArabicRegular();

    // Add content
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData(
          defaultTextStyle: pw.TextStyle(font: englishFont),
        ),
        header: (context) => buildHeader(emoji ,),
        footer: (context) => pw.Text(
          'Page ${context.pageNumber} of ${context.pagesCount}',
          style: const pw.TextStyle(fontSize: 14),
        ),
        build: (context) => [
          //English Section
          pw.SizedBox(height: 16),

          buildSummary(
            englishFont,
              title: "Summary",
              desc:
                  'Dedicated and enthusiastic entry-level Flutter developer with a'
                  "passion for mobile app development. Proficient in utilizing the Flutter framework to create engaging"
                  "and user-friendly cross-platform applications. Possesses a solid understanding of Dart programming"
                  "language and mobile UI/UX design principles. Strong problem-solving skills and a collaborative mindset,"
                  "eager to contribute to innovative projects and learn from experienced professionals in the field."),

          buildWorkHistory(emoji, englishFont,
              title: "Work Experience",
              desc:
                  "• Developed and maintained mobile applications using Flutter, including Sree3 and Qanony.\n"
                  "• Collaborated with designers and other developers to implement user-friendly interfaces. \n"
                  "• Participated in code reviews and contributed to team discussions.",
              role: 'flutter intern',
              company: 'Creative Minds',
              info: 'Tanta    07/2024 - 09/2024'),

          pw.SizedBox(height: 8),

          buildProjects(emoji,englishFont,
              title: "Projects",
              desc:
                  "• chat app, Quiz app, Weather app , GPA calculator \n• Tic tac Toe game, Store app,"
                  "  map app , Stop It's Complete"),

          pw.SizedBox(height: 5),

          buildEducation(emoji,englishFont,
              title: "Education",
              faculty: "Faculty of Computer and Information",
              info: "Egypt	09/2020 - 07/2024",
              major: "Bachelor of Computer science"),

          pw.SizedBox(height: 14),

          buildSkills(emoji,englishFont,
              desc:
                  "•	OOP | RESTful APIs | Design Pattern | MVVM | Clean Architecture | Clean Code | Git | "
                  "Solid Principles | Dart | Bloc Pattern \n•	Problem Solving | Flutter Development | State Management | Deployment"
                  "\n•	Firebase | Communication Skills | Data Structures | agile development methodologies| English",
              title: "Skills"),

        ],
      ),
    );

pdf.addPage(
  pw.MultiPage(
    pageFormat: PdfPageFormat.a4,
    theme: pw.ThemeData(
      defaultTextStyle: pw.TextStyle(font: arabicFont ,  fontFallback: [fallbackFont],),
    ),
    header: (context) => buildHeader(emoji),
    footer: (context) => pw.Directionality(textDirection: pw.TextDirection.rtl, child:  pw.Text(
      'الصفحة ${context.pageNumber} من ${context.pagesCount}',
      style: const pw.TextStyle(fontSize: 14),
    )),
    build: (context) => [
 pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 16),
                buildSummary(
                  arabicFont,
                  title: "الملخص",
                  desc:
'مطور مبتدئ متحمس ومتفاني في تطوير تطبيقات Flutter مع شغف بتطوير تطبيقات الهاتف المحمول. '
        'متقن لاستخدام إطار عمل Flutter لإنشاء تطبيقات عبر الأنظمة الأساسية تفاعلية وسهلة الاستخدام. '
        'يمتلك فهمًا قويًا للغة برمجة Dart ومبادئ تصميم واجهات المستخدم وتجربة المستخدم للهاتف المحمول. '
        'مهارات حل المشكلات القوية وعقلية تعاونية، متحمس للمساهمة في المشاريع المبتكرة والتعلم من المهنيين ذوي الخبرة في المجال.',
                ),
                buildWorkHistory(
                  emoji, arabicFont,
                  title: "الخبرة العملية",
                  desc:
                      "• تطوير وصيانة تطبيقات الهاتف المحمول باستخدام Flutter، بما في ذلك Sree3 وQanony.\n"
                      "• التعاون مع المصممين والمطورين الآخرين لتنفيذ واجهات مستخدم سهلة الاستخدام.\n"
                      "• المشاركة في مراجعات الكود والمساهمة في مناقشات الفريق.",
                  role: 'متدرب Flutter',
                  company: 'Creative Minds',
                  info: 'طنطا    07/2024 - 09/2024',
                ),
                pw.SizedBox(height: 8),
                buildProjects(
                  emoji, arabicFont,
                  title: "المشاريع",
                  desc:
                      "• تطبيق محادثة، تطبيق اختبار، تطبيق الطقس، تطبيق حساب المعدل التراكمي\n"
                      "• لعبة X و O، تطبيق متجر، تطبيق خرائط، تطبيق Stop It's Complete",
                ),
                pw.SizedBox(height: 5),
                buildEducation(
                  emoji, arabicFont,
                  title: "التعليم",
                  faculty: "كلية الحاسبات والمعلومات",
                  info: "مصر	09/2020 - 07/2024",
                  major: "بكالوريوس علوم الحاسب",
                ),
                pw.SizedBox(height: 14),
                buildSkills(
                  emoji, arabicFont,
                  desc:
                      "• البرمجة الشيئية | واجهات برمجة التطبيقات RESTful | نماذج التصميم | MVVM | النظافة المعمارية | الكود النظيف | Git | "
                      "مبادئ SOLID | لغة Dart | نمط BLoC \n• حل المشكلات | تطوير Flutter | إدارة الحالة | النشر"
                      "\n• Firebase | مهارات التواصل | هياكل البيانات | منهجيات التطوير الرشيق | اللغة الإنجليزية",
                  title: "المهارات",
                ),
              ],
            ),
          ),
    ],
  ),
);
    // Save locally
    final output = await getTemporaryDirectory();
    file = File("${output.path}/portfolio.pdf");
    await file.writeAsBytes(await pdf.save());
    return file;
  }

  static Future<void> printPDF() async {
    await OpenFilex.open(file.path);
  }

  static Future<void> sharePDF() async {
    await Printing.sharePdf(
        bytes: file.readAsBytesSync(), filename: 'portfolio.pdf');
  }
}

pw.Widget buildContainer(String text , font) {
  return pw.Container(
    padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 5),
    decoration: pw.BoxDecoration(
      color: PdfColor.fromHex("#cdf1e7"),
      borderRadius: pw.BorderRadius.circular(8),
    ),
    child: pw.Text(text,
        style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold , font: font  )),
  );
}

pw.Widget buildHeader(pw.Font emoji ) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.center,
    children: [
      pw.Text("Khadiga Gamal",
          style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
      pw.SizedBox(height: 8),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          pw.Text("🗺 ",
              style: pw.TextStyle(
                color: PdfColor.fromHex("#89ecda"),
                fontFallback: [emoji],
              )),
          pw.SizedBox(width: 3),
          pw.Text("Cairo , Egypt ", style: const pw.TextStyle(fontSize: 10)),
          pw.SizedBox(width: 8),
          pw.Text("📱 ",
              style: pw.TextStyle(
                fontFallback: [emoji],
              )),
          pw.SizedBox(width: 3),
          pw.Text("+20 1119115416 ", style: const pw.TextStyle(fontSize: 10)),
          pw.SizedBox(width: 8),
          pw.Text("✉ ",
              style: pw.TextStyle(
                color: PdfColor.fromHex("#89ecda"),
                fontFallback: [emoji],
              )),
          pw.SizedBox(width: 3),
          pw.Text("khadigagamal782@gmail.com",
              style: const pw.TextStyle(fontSize: 10)),
        ],
      ),
    ],
  );
}

pw.Widget buildSummary(font ,{required title, required desc}  ) {
  return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
    buildContainer(title, font ),
    pw.SizedBox(height: 8),
    pw.Paragraph(text: desc , style: pw.TextStyle(font:font )),
    pw.SizedBox(height: 8),
  ]);
}

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
      pw.Text(role, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
      pw.Text(company, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
      pw.Text(info, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
    ]),
    pw.SizedBox(height: 5),
    pw.Paragraph(
        text: desc,
        style: pw.TextStyle(
          fontFallback: [emoji],
        )),
  ]);
}

pw.Widget buildProjects(pw.Font emoji, font, {required title, required desc}) {
  return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
    buildContainer(title, font),
    pw.SizedBox(height: 8),
    pw.Paragraph(
      text: desc,
      style: pw.TextStyle(
        fontFallback: [emoji],
      ),
    ),
  ]);
}

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

pw.Widget buildSkills(pw.Font emoji, font, {required title, required desc}) {
  return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
    buildContainer(title, font),
    pw.SizedBox(height: 8),
    pw.Paragraph(
      text: desc,
      style: pw.TextStyle(
        fontFallback: [emoji],
      ),
    ),
  ]);
}
