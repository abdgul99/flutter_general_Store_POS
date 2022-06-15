import 'package:flutter/material.dart';

class SelectUnitsAll extends StatelessWidget {
  const SelectUnitsAll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 38,
        width: 500.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5.0,
            ),
            Table(
              children: const [
                TableRow(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    children: [
                      Text(
                        'Code',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Text(
                        'Description',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Text(
                        'Qty',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Text(
                        'Price',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Text(
                        'Amount',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Text(
                        'SalesMan',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ]),
                TableRow(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    children: [
                      Text(
                        '0.0',
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                      Text(
                        '0.0',
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                      Text(
                        '0.0',
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                      Text(
                        '0.0',
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                      Text(
                        '0.0',
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                      Text(
                        '0.0',
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                    ]),
              ],
            ),
          ],
        ));
  }
}
