import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rasid_task/features/pdf/pdf_service.dart';


class HomeScreen extends StatelessWidget {

const  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PdfService.generatePortfolioPDF(),
      builder: (context , sna) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
             // mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30,),
               const  Text('Portfolio PDF Generator' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
               // const Spacer(),
                Lottie.asset("assets/pdf.json"),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: ()  {
                        PdfService.printPDF();
                      },
                      child: const Text('Open PDF' ,),
                    ),
                    
                    ElevatedButton(
                      onPressed: ()   {
                        PdfService.sharePDF();
                      },
                      child: const Text('Share PDF'),
                    ),
                  ],
                ),
                const Spacer(flex: 2,),
              ],
            ),
          ),
        );
      }
    );
  }
}
