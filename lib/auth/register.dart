import 'package:flutter/material.dart';
import 'package:ujian_api/model/listWork.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  // controllers untuk menangkap input
  final TextEditingController namaDepanController = TextEditingController();
  final TextEditingController namaBelakangController = TextEditingController();
  final TextEditingController umurController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  Future<void> handleSubmit() async {
    // Mulai loading dan non-aktifkan button
    setState(() {
      isLoading = true;
    });

    // waktu loading
    await Future.delayed(const Duration(seconds: 2));

    // Ambil nilai input (tidak disimpan/permanen; hanya untuk penggunaan lokal jika diperlukan)

    if (!mounted) return;

    // Navigasi ke ListWork (tanpa mengoper data)
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const ListWorkPage()));
  }

  @override
  void dispose() {
    namaDepanController.dispose();
    namaBelakangController.dispose();
    umurController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Akun'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Judul
              const SizedBox(height: 20),
              const Text(
                'Form Pendaftaran',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),

              // Nama Depan
              TextField(
                controller: namaDepanController,
                decoration: InputDecoration(
                  labelText: 'Nama Depan',
                  hintText: 'Masukkan nama depan Anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),

              // Nama Belakang
              TextField(
                controller: namaBelakangController,
                decoration: InputDecoration(
                  labelText: 'Nama Belakang',
                  hintText: 'Masukkan nama belakang Anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),

              // Umur
              TextField(
                controller: umurController,
                decoration: InputDecoration(
                  labelText: 'Umur',
                  hintText: 'Masukkan umur Anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.cake),
                ),
              ),
              const SizedBox(height: 15),

              // Email
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Masukkan email Anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),

              // Button dengan Loading
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading ? null : handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    disabledBackgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 24,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
