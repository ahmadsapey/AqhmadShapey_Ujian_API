import 'package:flutter/material.dart';

class ListWorkPage extends StatelessWidget {
  const ListWorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Work'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'Berhasil masuk ke halaman ListWork.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
