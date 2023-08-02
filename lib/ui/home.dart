import 'package:flutter/material.dart';
import 'dart:math';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/ui/calButton.dart';

class Solve extends StatefulWidget {
  const Solve({super.key});

  @override
  State<Solve> createState() => _SolveState();
}

class _SolveState extends State<Solve> {
  var _inpt = '';
  var _outpt ='';

  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.00),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(20.00),
                  alignment: Alignment.centerRight,
                  child: Text(
                    _inpt,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10.00),
                  alignment: Alignment.centerRight,
                  child: Text(
                    _outpt,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return CalButton(
                          color: Colors.blue,
                          textColor: Colors.black,
                          buttonText: buttons[index],
                          buttonOnTapped: () {
                            setState(() {
                              _inpt = '';
                              _outpt = '';
                            });
                          });
                    } else if (index == 1) {
                      return const CalButton(
                          buttonText: '+/-',
                          color: Colors.blue,
                          textColor: Colors.black);
                    } else if (index == 2) {
                      return CalButton(
                          buttonText: buttons[index],
                          color: Colors.blue,
                          textColor: Colors.black,
                          buttonOnTapped: () {
                            setState(() {
                              _inpt += buttons[index];
                            });
                          });
                    } else if (index == 3) {
                      return CalButton(
                        buttonText: buttons[index],
                        color: Colors.blue,
                        textColor: Colors.black,
                        buttonOnTapped: () {
                          setState(() {
                            _inpt = _inpt.substring(0, _inpt.length - 1);
                          });
                        },
                      );
                    } else if (index == 18) {
                      return CalButton(
                        buttonText: buttons[index],
                        color: Colors.blue,
                        textColor: Colors.black,
                        buttonOnTapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                      );
                    } else {
                      return CalButton(
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.grey
                            : Colors.grey,
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.white,
                        buttonOnTapped: () {
                          setState(() {
                            _inpt += buttons[index];
                          });
                        },
                      );
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }

  void equalPressed() {
    String finalist = _inpt;
    finalist = _inpt.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(finalist);
    ContextModel con = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, con);
    _outpt = eval.toString();
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
}
