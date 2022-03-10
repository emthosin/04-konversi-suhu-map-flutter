import 'package:flutter/cupertino.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.nama,
    required this.hasil,
  }) : super(key: key);

  final double hasil;
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hasil",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            hasil.toStringAsFixed(1),
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
