import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rasid_task/core/colors.dart';
import 'package:rasid_task/features/pdf/pdf_service.dart';

import '../../../../core/common/widgets/custom_button.dart';

class PDFScreen extends StatelessWidget {
  const PDFScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:FutureBuilder<void>(
      future: PdfService.generatePortfolioPDF(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
           else{
             return Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Spacer(),
                const Text(
                  'Portfolio PDF Generator',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Lottie.asset("assets/images/pdf.json"),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      color: AllColors.green,
                      text: "Open PDF",
                      onPressed: () => PdfService.printPDF(),
                    ),
                    CustomButton(
                      color: AllColors.green,
                      text: 'Share PDF',
                      onPressed: () => PdfService.sharePDF(),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            );
           }
          }
        ),
      ),
    );
  }
}
