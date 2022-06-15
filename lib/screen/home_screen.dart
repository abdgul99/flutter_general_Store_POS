// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:fruits/components/selected_units_table.dart';
import 'package:fruits/components/select_units_all_table.dart';
import 'package:fruits/components/all_units.dart';
import 'package:fruits/components/shortcuts_class.dart';
import 'package:fruits/components/units_images.dart';
import 'package:fruits/components/bottom_table.dart';
import 'package:fruits/components/calculator_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruits/controler/state_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ref.read(itemsProvider).allItems(label: '');
  }

  @override
  Widget build(BuildContext context) {
    ScrollController arrowsController = ScrollController();
    final item = ref.watch(itemsProvider);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          //Screen Start from this Row
          //We have 3 colunms in this row
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Colunm 1
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectedUnitsTable(),
                  // SelectUnitsAll(),
                  SizedBox(
                    height: 10.0,
                  ),
                  AllUnits(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: UnitsImages(),
                  ),
                  BottomTable(),
                ],
              ),
              SizedBox(
                width: 210,
                height: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.black38),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Menu'),
                          Text('Misc'),
                        ],
                      ),
                    ),
                    //Shortcuts
                    Expanded(child: ShortcutsClass()),
                    //Calculator
                    CalculatorClass(),
                  ],
                ),
              ),
              Expanded(
                //Column 3
                child: Column(
                  children: [
                    item.selectedItem.isNotEmpty
                        ? Container(
                            height: 200.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image: item.showItem.isNotEmpty
                                      ? AssetImage("${item.showItem[0].image}")
                                      : AssetImage(
                                          "${item.selectedItem.last.image}"),
                                  fit: BoxFit.fill,
                                )))
                        : SizedBox(
                            height: 200.0,
                            child: Center(child: Text('No Selected Item'))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: SizedBox(
                        height: 20,
                        width: 500.0,
                        child: DataTable(
                            dataRowHeight: 20.0,
                            dividerThickness: 1,
                            headingRowHeight: 20.0,
                            showBottomBorder: true,
                            columnSpacing: 0.0,
                            dataTextStyle: const TextStyle(
                              fontSize: 10.0,
                            ),
                            columns: const [
                              DataColumn(
                                label: Text('Hold No'),
                              ),
                              DataColumn(label: VerticalDivider()),
                              DataColumn(
                                label: Text('Item'),
                              ),
                              DataColumn(label: VerticalDivider()),
                              DataColumn(
                                label: Text('Total'),
                              ),
                            ],
                            rows: [
                              DataRow(
                                // ignore: prefer_const_literals_to_create_immutables
                                cells: [
                                  DataCell(
                                    Text('123'),
                                  ),
                                  DataCell(VerticalDivider()),
                                  DataCell(
                                    item.showItem.isNotEmpty
                                        ? Text(item.showItem[0].qty.toString())
                                        : item.selectedItem.isNotEmpty
                                            ? Text(item.selectedItem.last.qty
                                                .toString())
                                            : Text('0.0'),
                                  ),
                                  DataCell(VerticalDivider()),
                                  DataCell(
                                    item.showItem.isNotEmpty
                                        ? Text(
                                            item.showItem[0].price.toString())
                                        : item.selectedItem.isNotEmpty
                                            ? Text(item.selectedItem.last.price
                                                .toString())
                                            : Text('0.0'),
                                  ),
                                ],
                              ),
                              // DataRow(
                              //   // ignore: prefer_const_literals_to_create_immutables
                              //   cells: [
                              //     DataCell(
                              //       Text('5'),
                              //     ),
                              //     DataCell(VerticalDivider()),
                              //     DataCell(
                              //       Text('2'),
                              //     ),
                              //     DataCell(VerticalDivider()),
                              //     DataCell(
                              //       Text('23.0'),
                              //     ),
                              //   ],
                              // ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Table(
                          // border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      'Total',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 70.0),
                                    child: Text(
                                      item.total.toString(),
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                ]),
                            TableRow(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 93, 85, 85),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      'Total Qty',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 70.0),
                                    child: Text(
                                      item.qty.toString(),
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                ]),
                            TableRow(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      'Sub Total',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 70.0),
                                    child: Text(
                                      item.subTotal.toString(),
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                ]),
                            // TableRow(
                            //     decoration: BoxDecoration(
                            //       color: Color.fromARGB(255, 93, 85, 85),
                            //     ),
                            //     children: [
                            //       Padding(
                            //         padding: const EdgeInsets.all(2.0),
                            //         child: Text(
                            //           'Discount',
                            //           style: TextStyle(fontSize: 12.0),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(left: 70.0),
                            //         child: Text(
                            //           '0.0',
                            //           style: TextStyle(fontSize: 12.0),
                            //         ),
                            //       ),
                            //     ]),
                            // TableRow(
                            //     decoration: BoxDecoration(
                            //       color: Colors.black,
                            //     ),
                            //     children: [
                            //       Padding(
                            //         padding: const EdgeInsets.all(2.0),
                            //         child: Text(
                            //           'Tax',
                            //           style: TextStyle(fontSize: 12.0),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(left: 70.0),
                            //         child: Text(
                            //           '0.00',
                            //           style: TextStyle(fontSize: 12.0),
                            //         ),
                            //       ),
                            //     ]),
                            TableRow(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 93, 85, 85),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      'RoundOff',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 70.0),
                                    child: Text(
                                      '',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                ]),
                          ]),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('NET Total'),
                            Text(
                              item.total.toString(),
                              style: TextStyle(
                                  fontSize: 35.0, color: Colors.yellowAccent),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 52.0,
                            width: 1.0,
                            decoration: BoxDecoration(color: Colors.black),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('TENDER'),
                                  Text(
                                    '23.50',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: Container(
                            height: 52.0,
                            width: 1.0,
                            decoration: BoxDecoration(color: Colors.black),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('BALANCE'),
                                  Text(
                                    '23.50',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.redAccent),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// scrol bar

// Container(
//   height: 100,
// child: DraggableScrollbar.arrows(
//   backgroundColor: Color.fromARGB(135, 255, 255, 255),
//   heightScrollThumb: 70.0,
//   alwaysVisibleScrollThumb: true,
//   controller: arrowsController,
//   child: ListView.builder(
//       controller: arrowsController,
//       itemCount: 1000,
//       itemExtent: 100.0,
//       itemBuilder: (context, index) {
//         return Container(
//           padding: EdgeInsets.all(8.0),
//           child: Material(
//             elevation: 4.0,
//             borderRadius: BorderRadius.circular(4.0),
//             color: Colors.purple[index % 9 * 100],
//             child: Center(
//               child: Text(index.toString()),
//             ),
//           ),
//         );
//       },
//     ),
//   ),
// ),
