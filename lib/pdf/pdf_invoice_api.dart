import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';

class PdfApi {
  static Future<File> saveDocument({
    required String name,
    required PdfDocument pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile() async {
    await OpenFile.open("""C:\\Users\\Master\\Documents\\my_invoice.pdf""");
  }
}


  // static Widget invoice(ItemsState item) {
  //   return Column(children: [
  //     Table(
  //       border: TableBorder.all(style: BorderStyle.solid),
  //       children: <TableRow>[
  //         TableRow(
  //             decoration: BoxDecoration(
  //                 // color: Color.fromARGB(255, 10, 10, 10),
  //                 ),
  //             children: [
  //               Center(
  //                 child: Text(
  //                   item.selectedItem[0].name,
  //                   style: TextStyle(fontSize: 14.0),
  //                 ),
  //               ),
  //               Center(
  //                 child: Text(
  //                   'Description',
  //                   style: TextStyle(fontSize: 14.0),
  //                 ),
  //               ),
  //               Center(
  //                 child: Text(
  //                   'Qty',
  //                   style: TextStyle(fontSize: 14.0),
  //                 ),
  //               ),
  //               Center(
  //                 child: Text(
  //                   'Price',
  //                   style: TextStyle(fontSize: 14.0),
  //                 ),
  //               ),
  //               Center(
  //                 child: Text(
  //                   'Amount',
  //                   style: TextStyle(fontSize: 14.0),
  //                 ),
  //               ),
  //             ]),
  //       ],
  //     ),
  //     //table items
  //   ]);
  // }

//  final pdf = pw.Document();
//     final font = await rootBundle.load("fonts/Roboto-Thin.ttf");
//     final ttf = pw.Font.ttf(font);

//     pdf.addPage(pw.MultiPage(
//       orientation: pw.PageOrientation.portrait,
//       crossAxisAlignment: pw.CrossAxisAlignment.stretch,
//       mainAxisAlignment: pw.MainAxisAlignment.start,
//       pageFormat: PdfPageFormat.a6,
//       maxPages: 1,
//       header: (context) => pw.Container(
//         height: 50,
//         child: pw.Column(
//           children: [
//             pw.Consumer(
//               builder: (context, ref, child) {
//                 return ;
//               },
//             )
//             pw.Center(
//               child: pw.Text('itemtopdf'),
//             ),
//           ],
//         ),
//       ),
//       build: (context) => [
      

//         // getTable()
//         pw.Divider(),
//       ],
//     ));
