import 'package:pdf/widgets.dart' as pw;
import 'package:rasid_task/features/pdf/view/widgets/education.dart';
import 'package:rasid_task/features/pdf/view/widgets/projects.dart';
import 'package:rasid_task/features/pdf/view/widgets/skills.dart';
import 'package:rasid_task/features/pdf/view/widgets/summary.dart';
import 'package:rasid_task/features/pdf/view/widgets/work.dart';

pw.Widget arabicSection(pw.Font emoji, font,) {
  return   pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 16),
                buildSummary(
                  font,
                  title: "الملخص",
                  desc:
'مطور مبتدئ متحمس ومتفاني في تطوير تطبيقات Flutter مع شغف بتطوير تطبيقات الهاتف المحمول. '
        'متقن لاستخدام إطار عمل Flutter لإنشاء تطبيقات عبر الأنظمة الأساسية تفاعلية وسهلة الاستخدام. '
        'يمتلك فهمًا قويًا للغة برمجة Dart ومبادئ تصميم واجهات المستخدم وتجربة المستخدم للهاتف المحمول. '
        'مهارات حل المشكلات القوية وعقلية تعاونية، متحمس للمساهمة في المشاريع المبتكرة والتعلم من المهنيين ذوي الخبرة في المجال.',
                ),
                buildWorkHistory(
                  emoji,font,
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
                  emoji,font,
                  title: "المشاريع",
                  desc:
                      "• تطبيق محادثة، تطبيق اختبار، تطبيق الطقس، تطبيق حساب المعدل التراكمي\n"
                      "• لعبة X و O، تطبيق متجر، تطبيق خرائط، تطبيق Stop It's Complete",
                ),
                pw.SizedBox(height: 5),
                buildEducation(
                  emoji, font,
                  title: "التعليم",
                  faculty: "كلية الحاسبات والمعلومات",
                  info: "مصر	09/2020 - 07/2024",
                  major: "بكالوريوس علوم الحاسب",
                ),
                pw.SizedBox(height: 14),
                buildSkills(
                  emoji, font,
                  desc:
                      "• البرمجة الشيئية | واجهات برمجة التطبيقات RESTful | نماذج التصميم | MVVM | النظافة المعمارية | الكود النظيف | Git | "
                      "مبادئ SOLID | لغة Dart | نمط BLoC \n• حل المشكلات | تطوير Flutter | إدارة الحالة | النشر"
                      "\n• Firebase | مهارات التواصل | هياكل البيانات | منهجيات التطوير الرشيق | اللغة الإنجليزية",
                  title: "المهارات",
                ),
              ],
            ),
          );
}