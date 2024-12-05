import 'package:pdf/widgets.dart' as pw;
import 'package:rasid_task/features/pdf/view/widgets/education.dart';
import 'package:rasid_task/features/pdf/view/widgets/projects.dart';
import 'package:rasid_task/features/pdf/view/widgets/skills.dart';
import 'package:rasid_task/features/pdf/view/widgets/summary.dart';
import 'package:rasid_task/features/pdf/view/widgets/work.dart';

pw.Widget englishSection(pw.Font emoji, font,) {
  return pw.Column(
   crossAxisAlignment: pw.CrossAxisAlignment.start,
  children: [
              pw.SizedBox(height: 16),

          buildSummary(
            font,
              title: "Summary",
              desc:
                  'Dedicated and enthusiastic entry-level Flutter developer with a'
                  "passion for mobile app development. Proficient in utilizing the Flutter framework to create engaging"
                  "and user-friendly cross-platform applications. Possesses a solid understanding of Dart programming"
                  "language and mobile UI/UX design principles. Strong problem-solving skills and a collaborative mindset,"
                  "eager to contribute to innovative projects and learn from experienced professionals in the field."),

          buildWorkHistory(emoji,  font,
              title: "Work Experience",
              desc:
                  "• Developed and maintained mobile applications using Flutter, including Sree3 and Qanony.\n"
                  "• Collaborated with designers and other developers to implement user-friendly interfaces. \n"
                  "• Participated in code reviews and contributed to team discussions.",
              role: 'flutter intern',
              company: 'Creative Minds',
              info: 'Tanta    07/2024 - 09/2024'),

          pw.SizedBox(height: 8),

          buildProjects(emoji, font,
              title: "Projects",
              desc:
                  "• chat app, Quiz app, Weather app , GPA calculator \n• Tic tac Toe game, Store app,"
                  "  map app , Stop It's Complete"),

          pw.SizedBox(height: 5),

          buildEducation(emoji, font,
              title: "Education",
              faculty: "Faculty of Computer and Information",
              info: "Egypt	09/2020 - 07/2024",
              major: "Bachelor of Computer science"),

          pw.SizedBox(height: 14),

          buildSkills(emoji, font,
              desc:
                  "•	OOP | RESTful APIs | Design Pattern | MVVM | Clean Architecture | Clean Code | Git | "
                  "Solid Principles | Dart | Bloc Pattern \n•	Problem Solving | Flutter Development | State Management | Deployment"
                  "\n•	Firebase | Communication Skills | Data Structures | agile development methodologies| English",
              title: "Skills"),

  ]
);
}
