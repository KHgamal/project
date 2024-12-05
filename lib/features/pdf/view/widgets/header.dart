import 'package:pdf/widgets.dart' as pw;

pw.Widget buildHeader(pw.Font emoji ) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.center,
    children: [
      pw.Text("Khadiga Gamal",
          style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
      pw.SizedBox(height: 8),
     pw.Center(child:  pw.Text("🗺  Cairo , Egypt     📱  +20 1119115416     ✉  khadigagamal782@gmail.com",
        textAlign: pw.TextAlign.center , style: pw.TextStyle(
            fontFallback: [emoji],
          )),)
    ],
  );
}