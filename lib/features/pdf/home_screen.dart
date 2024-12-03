import 'package:flutter/material.dart';
import 'package:rasid_task/features/pdf/pdf_service.dart';


class HomeScreen extends StatelessWidget {

const  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PdfService.generatePortfolioPDF(),
      builder: (context , sna) {
        return Scaffold(
          appBar: AppBar(title: const Text('Portfolio PDF Generator')),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: ()  {
                    PdfService.printPDF();
                  },
                  child: const Text('Open PDF' ,),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: ()   {
                    PdfService.sharePDF();
                  },
                  child: const Text('Share PDF'),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
