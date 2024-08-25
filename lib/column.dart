import 'package:flutter/material.dart';

class ColumnWidget extends StatefulWidget {
  const ColumnWidget({super.key});

  @override
  State<ColumnWidget> createState() => _ColumnWidgetState();
}

class _ColumnWidgetState extends State<ColumnWidget> {
  final TextEditingController _controller = TextEditingController();
  String _kategori = '';
  String _errorMessage = '';

  void _sortirNilai() {
    setState(() {
      String nilaiInput = _controller.text;
      if (nilaiInput.isEmpty) {
        _errorMessage = 'Nilai tidak boleh kosong';
        _kategori = '';
      } else {
        int? nilai = int.tryParse(nilaiInput);

        if (nilai == null) {
          _errorMessage = 'Nilai tidak boleh bertipe String';
          _kategori = '';
        } else {
          _errorMessage = '';
          if (nilai >= 85 && nilai <= 100) {
            _kategori = 'A';
            _errorMessage;
          } else if (nilai >= 70 && nilai <= 100) {
            _kategori = 'B';
            _errorMessage;
          } else if (nilai >= 55 && nilai <= 100) {
            _kategori = 'C';
            _errorMessage;
          } else if (nilai < 55 && nilai >= 0) {
            _kategori = 'D';
            _errorMessage;
          } else {
            _kategori = 'Nilai tidak termasuk kategori';
            _errorMessage;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Container(
          width: 300,
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Masukkan nilai siswa',
              labelText: 'Nilai Siswa',
              border: OutlineInputBorder(),
              errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
            ),
          ),
        )),
        SizedBox(
          
          height: 20,
        ),
        ElevatedButton(onPressed: _sortirNilai, child: Text('Sortir')),
        SizedBox(height: 20),
        Text(
          'Kategori Nilai: $_kategori',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
