import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruits/controler/state_controler.dart';
import 'package:fruits/controler/state_provider.dart';
import 'package:printing/printing.dart';

import '../pdf/invoice.dart';

class ShortcutsClass extends ConsumerWidget {
  const ShortcutsClass({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clear = ref.read(itemsProvider.notifier);
    final getItem = ref.watch(itemsProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15.0),
      child: SizedBox(
        height: 280.0,
        // width: 500.0,
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                primary: false,
                // padding: const EdgeInsets.only(top: 0.0),
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 1 / .5,
                crossAxisCount: 2,
                children: <Widget>[
                  ShortcutsButtons(
                    label: '  F2\nClear',
                    clear: clear,
                    color: const Color.fromARGB(255, 13, 87, 216),
                  ),
                  const ShortcutsButtons(
                    label: '      F3\nVoid Bill',
                    color: Colors.blueAccent,
                  ),
                  const ShortcutsButtons(
                    label: '    F4\nTender',
                    color: Colors.lightGreenAccent,
                  ),
                  const ShortcutsButtons(
                    label: '      F3\nDiscount',
                    color: Color.fromARGB(255, 174, 166, 175),
                  ),
                  //label
                  LabelPrint(getItem: getItem),
                  const ShortcutsButtons(
                    label: '     F7\nRelease',
                    color: Colors.blueGrey,
                  ),
                  const ShortcutsButtons(
                    label: '     F8\nSelesMan',
                    color: Colors.yellowAccent,
                  ),
                  const ShortcutsButtons(
                    label: '    F9\nExchange',
                    color: const Color.fromARGB(255, 255, 169, 82),
                  ),
                  const ShortcutsButtons(
                    label: '    F11\nPriceChan',
                    color: Color.fromARGB(255, 216, 105, 31),
                  ),
                  const ShortcutsButtons(
                    label: 'F12\nAuto',
                    color: const Color.fromARGB(255, 215, 17, 17),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Column(
                                  children: [
                                    Text('Are You Sure'),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.transparent),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('No')),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.transparent),
                                            onPressed: () {
                                              Navigator.pop(exit(0));
                                            },
                                            child: Text('Yes')),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 15.0,
                      primary: const Color.fromARGB(255, 199, 17, 105),
                    ),
                    child: Text(
                      ' F10\nExit',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const ShortcutsButtons(
                    label: '  Esc\nNETS',
                    color: Color.fromARGB(255, 166, 16, 200),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LabelPrint extends StatelessWidget {
  const LabelPrint({
    Key? key,
    required this.getItem,
  }) : super(key: key);

  final ItemsState getItem;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Row(
              children: const [
                Text('Invoice'),
              ],
            ),
            actions: [
              Center(
                child: SizedBox(
                  height: 400.0,
                  width: 300.0,
                  child: PdfPreview(build: (format) => generatePdf(getItem)),
                ),
              )
            ],
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        elevation: 15.0,
        primary: Colors.greenAccent,
      ),
      child: const Text(
        '  F6\nHold',
        style: TextStyle(
            color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ShortcutsButtons extends StatelessWidget {
  const ShortcutsButtons({
    required this.label,
    required this.color,
    this.clear,
    Key? key,
  }) : super(key: key);
  final ItemsState? clear;
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        clear!.clearTable();
      },
      style: ElevatedButton.styleFrom(
        elevation: 15.0,
        primary: color,
      ),
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}



// final PdfDocument document = PdfDocument();
//         final PdfPage page = document.pages.add();
//         final PdfGrid grid = PdfGrid();
//         final Uint8List imageData = File('images/bytex.png').readAsBytesSync();
// //Load the image using PdfBitmap.
//         final PdfBitmap image = PdfBitmap(imageData);
// //Draw the image to the PDF page.
//         page.graphics.drawImage(image, const Rect.fromLTWH(0, 20, 270, 210));

//         page.graphics.drawString(
//             'Invoice#123', PdfStandardFont(PdfFontFamily.helvetica, 40),
//             brush: PdfSolidBrush(PdfColor(0, 0, 0)),
//             bounds: const Rect.fromLTWH(10, 0, 0, 0));
//         page.graphics.drawString(
//             '${now}', PdfStandardFont(PdfFontFamily.helvetica, 12),
//             brush: PdfSolidBrush(PdfColor(0, 0, 0)),
//             bounds: const Rect.fromLTWH(10, 620, 0, 0));
//         page.graphics.drawString(
//             '_____________________________________________________________________',
//             PdfStandardFont(PdfFontFamily.helvetica, 40),
//             brush: PdfSolidBrush(PdfColor(0, 0, 0)),
//             bounds: const Rect.fromLTWH(10, 600, 0, 0));

//         page.graphics.drawString(
//             'ByteX', PdfStandardFont(PdfFontFamily.helvetica, 30),
//             brush: PdfSolidBrush(PdfColor(0, 0, 0)),
//             bounds: const Rect.fromLTWH(300, 50, 0, 0));
//         page.graphics.drawString(
//             'cell# +923431941718', PdfStandardFont(PdfFontFamily.helvetica, 20),
//             brush: PdfSolidBrush(PdfColor(0, 0, 0)),
//             bounds: const Rect.fromLTWH(300, 90, 0, 0));
//         page.graphics.drawString(
//             'Address:\nSultan Tower,\nMakanbagh,\nmingora Swat',
//             PdfStandardFont(PdfFontFamily.helvetica, 20),
//             brush: PdfSolidBrush(PdfColor(0, 0, 0)),
//             bounds: const Rect.fromLTWH(300, 110, 0, 0));

//         grid.columns.add(count: 5);
//         final PdfGridRow headerRow = grid.headers.add(1)[0];
//         headerRow.cells[0].value = 'Code';
//         headerRow.cells[1].value = 'Description';
//         headerRow.cells[2].value = 'Qty';
//         headerRow.cells[3].value = 'Price';
//         headerRow.cells[4].value = 'Amount';
//         headerRow.style.font = PdfStandardFont(PdfFontFamily.helvetica, 17,
//             style: PdfFontStyle.bold);

//         for (var item in getItem.selectedItem) {
//           PdfGridRow row = grid.rows.add();
//           print(item.price);
//           row.style.font = PdfStandardFont(PdfFontFamily.helvetica, 20);
//           row.cells[0].value = '123';
//           row.cells[1].value = '${item.name}';
//           row.cells[2].value = '${item.qty}';
//           row.cells[3].value = '${item.price}';
//           row.cells[4].value = '${item.amount}';
//         }
//         PdfGridRow row = grid.rows.add();
//         row.style.font = PdfStandardFont(PdfFontFamily.helvetica, 20);
//         row.cells[0].value = 'Total';
//         row.cells[1].value = '${getItem.selectedItem.length}';
//         row.cells[2].value = '${getItem.qty}';
//         row.cells[3].value = '${getItem.total}';
//         row.cells[4].value = '${getItem.subTotal}';

//         grid.style.cellPadding = PdfPaddings(left: 0, top: 0);
//         grid.style.font = PdfStandardFont(PdfFontFamily.helvetica, 17);
//         grid.draw(
//             page: page,
//             bounds: Rect.fromLTWH(0, 210, page.getClientSize().width,
//                 page.getClientSize().height));

//         PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: document);
// pw.ListView.builder(
//                       itemBuilder: (pw.Context context, int index) {
//                         return pw.Table(
//                             // border: pw.TableBorder.all(
//                             //     style: pw.BorderStyle.solid, width: 0),
//                             children: [
//                               pw.TableRow(children: [
//                                 pw.SizedBox(
//                                   width: 15.5,
//                                   height: 10.0,
//                                   child: pw.FittedBox(
//                                     fit: pw.BoxFit.fill,
//                                     child: pw.Center(
//                                       child: pw.Text('123->',
//                                           style: pw.TextStyle(
//                                             fontSize: 2.0,
//                                           )),
//                                     ),
//                                   ),
//                                 ),
//                                 pw.SizedBox(
//                                   width: 42.5,
//                                   height: 10.0,
//                                   child: pw.FittedBox(
//                                     fit: pw.BoxFit.fitHeight,
//                                     child: pw.Center(
//                                       child: pw.Text(
//                                           getItem.selectedItem[index].name,
//                                           style: pw.TextStyle(
//                                             fontSize: 5.0,
//                                           )),
//                                     ),
//                                   ),
//                                 ),
//                                 pw.SizedBox(
//                                   width: 13.5,
//                                   height: 10.0,
//                                   child: pw.FittedBox(
//                                     // fit: pw.BoxFit.fitWidth,
//                                     child: pw.Center(
//                                       child: pw.Text(
//                                           getItem.selectedItem[index].qty
//                                               .toString(),
//                                           style: pw.TextStyle(
//                                             fontSize: 5.0,
//                                           )),
//                                     ),
//                                   ),
//                                 ),
//                                 pw.SizedBox(
//                                   width: 15.5,
//                                   child: pw.FittedBox(
//                                     fit: pw.BoxFit.fitHeight,
//                                     child: pw.Center(
//                                       child: pw.Text(
//                                           getItem.selectedItem[index].price
//                                               .toString(),
//                                           style: pw.TextStyle(
//                                             fontSize: 5.0,
//                                           )),
//                                     ),
//                                   ),
//                                 ),
//                                 pw.SizedBox(
//                                   width: 30.5,
//                                   height: 10.0,
//                                   child: pw.FittedBox(
//                                     fit: pw.BoxFit.fitHeight,
//                                     child: pw.Center(
//                                       child: pw.Text(
//                                           getItem.selectedItem[index].amount
//                                               .toString(),
//                                           style: pw.TextStyle(
//                                             fontSize: 5.0,
//                                           )),
//                                     ),
//                                   ),
//                                 ),
//                               ]),
//                             ]);
//                       },
//                       itemCount: getItem.selectedItem.length,
//                     ),