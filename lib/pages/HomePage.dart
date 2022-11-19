import 'package:flutter/material.dart';

const List<String> list = <String>['+', '-', '*', '/'];

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  String dropdownValue = list.first;
  final numberController1 = TextEditingController();
  final numberController2 = TextEditingController();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  hintText: '0',
                ),
                controller: numberController1,
              ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 0,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 28
                      ),
                  ),
                );
              }).toList(),
            ),
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  hintText: '0',
                ),
                controller: numberController2,
              ),
            ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: TextButton(
                      onPressed: () {
                        Calculate();
                      },
                      child: Text(
                          '=',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white
                          )
                      )
                  ),
                ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 75,
              child: Text(
                  result.toString()
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Calculate(){
    switch(dropdownValue){
      case '+': {
        setState(() {
          result = double.parse(numberController1.text) + double.parse(numberController2.text);
        });
      }
      break;

      case '-': {
        setState(() {
          result = double.parse(numberController1.text) - double.parse(numberController2.text);
        });
      }
      break;

      case '*': {
        setState(() {
          result = double.parse(numberController1.text) * double.parse(numberController2.text);
        });
      }
      break;

      case '/': {
        setState(() {
          result = double.parse(numberController1.text) / double.parse(numberController2.text);
        });
      }
      break;
    }
  }
}