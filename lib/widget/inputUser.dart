import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.inputController,
  }) : super(key: key);

  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      decoration:
          const InputDecoration(hintText: "Masukkan Suhu Dalam Celcius"),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
      keyboardType: TextInputType.number,
    );
  }
}
