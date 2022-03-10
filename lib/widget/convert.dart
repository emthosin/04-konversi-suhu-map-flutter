import 'package:flutter/material.dart';

class Convertion extends StatelessWidget {
  const Convertion({
    Key? key,
    required this.konversi,
    required this.onPressed,
  }) : super(key: key);

  final Function konversi;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(
            40), // fromHeight use double.infinity as width and 40 is the height
      ),
      onPressed: onPressed,
      child: const Text('Konversi'),
    );
  }
}
