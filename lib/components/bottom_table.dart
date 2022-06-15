import 'package:flutter/material.dart';

class BottomTable extends StatelessWidget {
  const BottomTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                label: Text('Location'),
              ),
              DataColumn(label: VerticalDivider()),
              DataColumn(
                label: Text('Terminal'),
              ),
              DataColumn(label: VerticalDivider()),
              DataColumn(
                label: Text('Cashier'),
              ),
              DataColumn(label: VerticalDivider()),
              DataColumn(
                label: Text('Last inv #'),
              ),
              DataColumn(label: VerticalDivider()),
              DataColumn(
                label: Text('Lavst inv \$'),
              ),
              DataColumn(label: VerticalDivider()),
              DataColumn(
                label: Text('Member'),
              ),
            ],
            rows: const [
              DataRow(
                // ignore: prefer_const_literals_to_create_immutables
                cells: [
                  DataCell(
                    Text('HQ'),
                  ),
                  DataCell(VerticalDivider()),
                  DataCell(
                    Text('HQ-PC2'),
                  ),
                  DataCell(VerticalDivider()),
                  DataCell(
                    Text('CASHIER1'),
                  ),
                  DataCell(VerticalDivider()),
                  DataCell(
                    Text('HQ00008699'),
                  ),
                  DataCell(VerticalDivider()),
                  DataCell(
                    Text('23.50'),
                  ),
                  DataCell(VerticalDivider()),
                  DataCell(
                    Text('CASH'),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
