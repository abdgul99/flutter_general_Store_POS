import 'dart:typed_data';

import 'package:fruits/controler/state_controler.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:fruits/pdf/pdf_invoice_api.dart';
import 'package:pdf/pdf.dart' as pp;
import 'package:printing/printing.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/services.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

Future<Uint8List> generatePdf(ItemsState getItem) async {
  DateTime now = DateTime.now();
  final pdf = pw.Document(version: pp.PdfVersion.pdf_1_5, compress: true);
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final image = pw.MemoryImage(
    (await rootBundle.load('images/bytex.png')).buffer.asUint8List(),
  );
  pdf.addPage(
    pw.Page(
      pageFormat: pp.PdfPageFormat.roll57,
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            pw.SizedBox(
              height: 10.0,
              width: 40.0,
              child: pw.FittedBox(
                child: pw.Center(
                  child: pw.Text('Invoice#123',
                      style: pw.TextStyle(
                          font: font,
                          fontSize: 10.0,
                          fontWeight: pw.FontWeight.bold)),
                ),
              ),
            ),
            pw.SizedBox(
              height: 8.0,
              width: 10.0,
              child: pw.FittedBox(
                child: pw.Center(
                  child: pw.Text('Date: $now',
                      style: pw.TextStyle(
                          font: font,
                          fontSize: 10.0,
                          fontWeight: pw.FontWeight.bold)),
                ),
              ),
            ),
            pw.Row(children: [
              pw.SizedBox(
                height: 50.0,
                child: pw.Image(image),
              ),
              pw.Spacer(),
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text('ByteX',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 10.0,
                            fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(
                      width: 70.0,
                      child: pw.FittedBox(
                        child: pw.Text('Cell# +92-3434-8280775',
                            style: pw.TextStyle(
                                font: font,
                                fontSize: 20.0,
                                fontWeight: pw.FontWeight.bold)),
                      ),
                    ),
                    pw.SizedBox(
                      width: 70.0,
                      child: pw.FittedBox(
                        child: pw.Text(
                            'Addr: Sultan Tower, Makanbagh\nMingora Swat',
                            style: pw.TextStyle(
                                font: font,
                                fontSize: 20.0,
                                fontWeight: pw.FontWeight.bold)),
                      ),
                    ),
                  ]),
            ]),
            pw.Table(
                border:
                    pw.TableBorder.all(style: pw.BorderStyle.solid, width: 0),
                children: [
                  pw.TableRow(children: [
                    pw.Column(children: [
                      pw.Text('Code', style: pw.TextStyle(fontSize: 5.0))
                    ]),
                    pw.Column(children: [
                      pw.Text('Description',
                          style: pw.TextStyle(fontSize: 5.0)),
                    ]),
                    pw.Column(children: [
                      pw.Text('Qty', style: pw.TextStyle(fontSize: 5.0))
                    ]),
                    pw.Column(children: [
                      pw.Text('Price', style: pw.TextStyle(fontSize: 5.0))
                    ]),
                    pw.Column(children: [
                      pw.Text('Amount', style: pw.TextStyle(fontSize: 5.0))
                    ]),
                  ]),
                  //all selected item row
                  pw.TableRow(children: [
                    pw.Column(children: [
                      pw.ListView.builder(
                          itemBuilder: (pw.Context context, int index) {
                            return pw.Text('123',
                                style: pw.TextStyle(fontSize: 5.0));
                          },
                          itemCount: getItem.selectedItem.length),
                    ]),
                    pw.Column(children: [
                      pw.ListView.builder(
                          itemBuilder: (pw.Context context, int index) {
                            return pw.Text(getItem.selectedItem[index].name,
                                style: pw.TextStyle(fontSize: 5.0));
                          },
                          itemCount: getItem.selectedItem.length),
                    ]),
                    pw.Column(children: [
                      pw.ListView.builder(
                          itemBuilder: (pw.Context context, int index) {
                            return pw.Text(
                                getItem.selectedItem[index].qty.toString(),
                                style: pw.TextStyle(fontSize: 5.0));
                          },
                          itemCount: getItem.selectedItem.length),
                    ]),
                    pw.Column(children: [
                      pw.ListView.builder(
                          itemBuilder: (pw.Context context, int index) {
                            return pw.Text(
                                getItem.selectedItem[index].price.toString(),
                                style: pw.TextStyle(fontSize: 5.0));
                          },
                          itemCount: getItem.selectedItem.length),
                    ]),
                    pw.Column(children: [
                      pw.ListView.builder(
                          itemBuilder: (pw.Context context, int index) {
                            return pw.Text(
                                getItem.selectedItem[index].amount.toString(),
                                style: pw.TextStyle(fontSize: 5.0));
                          },
                          itemCount: getItem.selectedItem.length),
                    ]),
                  ]),
                  pw.TableRow(children: [
                    pw.Column(children: [
                      pw.Text('Total', style: pw.TextStyle(fontSize: 5.0))
                    ]),
                    pw.Column(children: [
                      pw.Text(getItem.selectedItem.length.toString(),
                          style: pw.TextStyle(fontSize: 5.0))
                    ]),
                    pw.Column(children: [
                      pw.Text(getItem.qty.toString(),
                          style: pw.TextStyle(fontSize: 5.0))
                    ]),
                    pw.Column(children: [
                      pw.Text(getItem.total.toString(),
                          style: pw.TextStyle(fontSize: 5.0))
                    ]),
                    pw.Column(children: [
                      pw.Text(getItem.subTotal.toString(),
                          style: pw.TextStyle(fontSize: 5.0))
                    ]),
                  ]),
                ]),
            pw.SizedBox(
              height: 200.0,
            ),
            pw.Divider(),
          ],
        );
      },
    ),
  );

  return pdf.save();
}
