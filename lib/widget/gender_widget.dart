import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final String gender;
  final IconData icon;
  final Color color;
  const GenderWidget(this.gender, this.icon, this.color, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 90,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$gender',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
