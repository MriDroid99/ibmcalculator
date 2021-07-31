import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  final String label;
  final int value;
  final Function onadd;
  final Function onremove;
  const DataWidget(this.label, this.value, this.onadd, this.onremove,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1e152f),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$value',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                mini: true,
                onPressed: () => onremove(),
                child: Icon(Icons.remove),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                mini: true,
                onPressed: () => onadd(),
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
