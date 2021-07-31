import 'package:flutter/material.dart';

// Widget
import '../widget/gender_widget.dart';
import '../widget/data_widget.dart';

enum Gender { Male, Female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _height = 180.0;
  var _weight = 80;
  var _age = 20;
  var gender = Gender.Male;

  void showSheet(int weight, double height, int age) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text('WEIGHT:'),
                          Text('$weight'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text('HEIGHT: '),
                          Text('${height.round()}'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text('AGE: '),
                          Text('$age'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text('RESULT: '),
                          Text('${weight / (height / 100) * (height / 100)}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0d0b20),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xff130f60),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = Gender.Male;
                        });
                      },
                      child: GenderWidget(
                        'MALE',
                        Icons.male,
                        gender == Gender.Male
                            ? Color(0xff130f60)
                            : Color(0xff1e152f),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = Gender.Female;
                        });
                      },
                      child: GenderWidget(
                        'FEMALE',
                        Icons.female,
                        gender == Gender.Female
                            ? Color(0xff130f60)
                            : Color(0xff1e152f),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Color(0xff1e152f),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('${_height.round()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          )),
                      Text('CM',
                          style: TextStyle(
                            color: Colors.grey,
                            // fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                    ],
                  ),
                  Slider(
                    value: _height,
                    onChanged: (val) {
                      setState(() {
                        _height = val;
                      });
                    },
                    min: 80,
                    max: 220,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: DataWidget(
                      'WEIGHT',
                      _weight,
                      () {
                        setState(() {
                          _weight++;
                        });
                      },
                      () {
                        setState(() {
                          _weight--;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DataWidget(
                      'Age',
                      _age,
                      () {
                        setState(() {
                          _age++;
                        });
                      },
                      () {
                        setState(() {
                          _age++;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Color(0xff130f60),
            child: MaterialButton(
              height: 50,
              onPressed: () {
                showSheet(_weight, _height, _age);
              },
              child: Text(
                'CALCULATE',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
