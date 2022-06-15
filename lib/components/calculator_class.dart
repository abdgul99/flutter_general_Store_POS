import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruits/controler/state_controler.dart';
import 'package:fruits/controler/state_provider.dart';

class CalculatorClass extends ConsumerWidget {
  const CalculatorClass({
    this.hight = 99.0,
    this.width = 44.0,
    this.positionBottom = 0.0,
    Key? key,
  }) : super(key: key);
  final double hight;
  final double width;
  final double positionBottom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculatorNumber = ref.read(itemsProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
      child: SizedBox(
        height: 198,
        child: Stack(
          children: [
            GridView.count(
              primary: false,
              // padding: const EdgeInsets.only(top: 0.0),
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 1 / 1.1,
              crossAxisCount: 4,
              shrinkWrap: true,
              children: <Widget>[
                CalculatorButtos(
                  number: 7,
                  itemsState: calculatorNumber,
                ),
                CalculatorButtos(
                  number: 8,
                  itemsState: calculatorNumber,
                ),
                CalculatorButtos(
                  number: 9,
                  itemsState: calculatorNumber,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 15.0,
                      primary: const Color.fromARGB(255, 209, 215, 221),
                    ),
                    child: const Icon(
                      Icons.keyboard_backspace_rounded,
                      color: Colors.black,
                    )),
                CalculatorButtos(
                  number: 4,
                  itemsState: calculatorNumber,
                ),
                CalculatorButtos(
                  number: 5,
                  itemsState: calculatorNumber,
                ),
                CalculatorButtos(
                  number: 6,
                  itemsState: calculatorNumber,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 15.0,
                    primary: const Color.fromARGB(255, 209, 215, 221),
                  ),
                  child: const Text(
                    'C',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                CalculatorButtos(
                  number: 1,
                  itemsState: calculatorNumber,
                ),
                CalculatorButtos(
                  number: 2,
                  itemsState: calculatorNumber,
                ),
                CalculatorButtos(
                  number: 3,
                  itemsState: calculatorNumber,
                ),
                ElevatedButton(
                  //this button is not any use but it will take place here to overly the last button

                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    primary: const Color.fromARGB(255, 209, 215, 221),
                  ),
                  child: const Text(
                    '',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                CalculatorButtos(
                  number: 0,
                  itemsState: calculatorNumber,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 15.0,
                    primary: const Color.fromARGB(255, 209, 215, 221),
                  ),
                  child: const Text(
                    '*',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 15.0,
                    primary: const Color.fromARGB(255, 209, 215, 221),
                  ),
                  child: const Text(
                    '.',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            //Plus Button out From the GridWidget
            Positioned(
              bottom: positionBottom,
              right: 0.0,
              child: SizedBox(
                height: hight,
                width: width,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 9.0,
                      primary: const Color.fromARGB(255, 209, 215, 221),
                    ),
                    child: const Icon(
                      Icons.subdirectory_arrow_left,
                      color: Colors.black,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

FocusNode focs11 = FocusNode();

class CalculatorButtos extends StatelessWidget {
  const CalculatorButtos({
    required this.number,
    required this.itemsState,
    Key? key,
  }) : super(key: key);
  final int number;
  final ItemsState itemsState;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        itemsState.calculator(number);
      },
      style: ElevatedButton.styleFrom(
        elevation: 15.0,
        primary: const Color.fromARGB(255, 209, 215, 221),
      ),
      child: Text(
        number.toString(),
        style: const TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
