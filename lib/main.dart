// ignore_for_file: deprecated_member_use, unnecessary_new

import 'package:flutter/material.dart';
import 'package:konversi_suhu_v2/widget/dropdown.dart';
import 'package:konversi_suhu_v2/widget/history.dart';
import 'package:konversi_suhu_v2/widget/inputUser.dart';
import 'package:konversi_suhu_v2/widget/result.dart';
import 'widget/convert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  final _listSatuanSuhu = ["Pilih Suhu", "Kelvin", "Reamur"];
  String _selectedDropdown = "Pilih Suhu";
  double _result = 0;
  final List<String> _listHasil = [];

  TextEditingController inputController = new TextEditingController();

  _onChangedDropdown(String value) {
    setState(() {
      _selectedDropdown = value;
    });
    konversi();
  }

  konversi() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_selectedDropdown == "Kelvin") {
        _result = _inputUser + 273;
        _listHasil
            .add("Konversi dari : $_inputUser Celcius ke $_result Kelvin");
      } else if (_selectedDropdown == "Reamur") {
        _result = (4 / 5) * _inputUser;
        _listHasil
            .add("Konversi dari : $_inputUser Celcius ke $_result Reamur");
      } else {
        _listHasil.add("Suhu belum dipilih");
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Konversi Suhu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
              title: const Text(
                  "Konverter Suhu | 2031710032 - M. Thosin Yuhaililul Hilmi")),
          body: Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Input(inputController: inputController),
                Dropdown(
                    selectedDropdown: _selectedDropdown,
                    listSatuanSuhu: _listSatuanSuhu,
                    onChangedDropdown: _onChangedDropdown),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Result(
                      hasil: _result,
                      nama: 'Hasil',
                    ),
                  ],
                ),
                // ignore: prefer_const_constructors
                Convertion(
                  konversi: konversi,
                  onPressed: konversi,
                ),
                History(listHasil: _listHasil)
              ],
            ),
          ),
        ));
  }
}
