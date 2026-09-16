import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() =>
      _FormPendaftaranPageState();
}

class _FormPendaftaranPageState
    extends State<FormPage> {

  final namaController = TextEditingController();
  final nisController = TextEditingController();
  final waController = TextEditingController();

  String? kelas;
  String? gender;

  List<String> ekskulTerpilih = [];

  final List<String> daftarKelas = [
    'X RPL 1',
    'X RPL 2',
    'X DKV',
    'XI RPL 1',
    'XI RPL 2',
    'XI DKV 1',
    'XI DKV 2',
    'XII RPL 1',
    'XII RPL 2',
    'XII DKV 1',
    'XII DKV 2',
  ];

  final List<String> daftarEkskul = [
    'Futsal',
    'Basket',
    'Paskibra',
    'Rohis',
    'Rokris',
    'Robotik',
    'Taekwondo',
    'Silat',
    'Tari',
  ];

  void simpanData() {
    if (namaController.text.isEmpty ||
        nisController.text.isEmpty ||
        kelas == null ||
        waController.text.isEmpty ||
        gender == null ||
        ekskulTerpilih.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Harap lengkapi semua data!',
          ),
        ),
      );
      return;
    }
    dataPendaftaran.add(
      DataPege(
        nama: namaController.text,
        nis: nisController.text,
        kelas: kelas!,
        noWa: waController.text,
        gender: gender!,
        ekstrakulikuler:
            List.from(ekskulTerpilih),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Pendaftaran berhasil!',
        ),
      ),
    );
    Navigator.pushReplacementNamed(
      context,
      '/data',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Pendaftaran',
        ),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),

      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              'Data Siswa',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // NAMA
            TextField(
              controller: namaController,

              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 15),

            // NIS
            TextField(
              controller: nisController,

              keyboardType:
                  TextInputType.number,

              decoration: const InputDecoration(
                labelText: 'NIS',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.badge),
              ),
            ),
            const SizedBox(height: 15),
            // KELAS
            DropdownButtonFormField<String>(
              value: kelas,
              decoration: const InputDecoration(
                labelText: 'Kelas',
                border: OutlineInputBorder(),
                prefixIcon:
                    Icon(Icons.class_),
              ),
              items: daftarKelas.map(
                (item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  kelas = value;
                });
              },
            ),
            const SizedBox(height: 15),
            // NO WA
            TextField(
              controller: waController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
              decoration: const InputDecoration(
                labelText: 'No. WhatsApp',
                hintText: '08xxxxxxxxxx',
                border: OutlineInputBorder(),
                prefixIcon:
                    Icon(Icons.phone),
              ),
            ),

            const SizedBox(height: 20),
            // GENDER
            const Text(
              'Jenis Kelamin',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            RadioListTile<String>(
              title: const Text(
                'Laki-laki',
              ),
              value: 'Laki-laki',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text(
                'Perempuan',
              ),
              value: 'Perempuan',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            const SizedBox(height: 10),
            // EKSKUL
            const Text(
              'Ekstrakurikuler',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Boleh memilih lebih dari satu.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Column(
              children:
                  daftarEkskul.map(
                (ekskul) {
                  return CheckboxListTile(
                    title: Text(ekskul),
                    value:
                        ekskulTerpilih
                            .contains(ekskul),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          ekskulTerpilih
                              .add(ekskul);
                        } else {
                          ekskulTerpilih
                              .remove(ekskul);
                        }
                      });
                    },
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 20),
            // BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: simpanData,
                icon: const Icon(
                  Icons.save,
                ),
                label: const Text(
                  'DAFTAR',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// DRAWER
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 75,
                  height: 75,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 10),

                const Text(
                  'Ekstrakurikuler',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  'SMKN 64 Jakarta',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          // HOME
          ListTile(
            leading: const Icon(Icons.home_rounded),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),

          // FORM
          ListTile(
            leading: const Icon(Icons.app_registration_rounded),
            title: const Text('Form Pendaftaran'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/form');
            },
          ),

          // DATA
          ListTile(
            leading: const Icon(Icons.assignment_rounded),
            title: const Text('Data Hasil Pendaftaran'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/data');
            },
          ),

          //GALLERY
          ListTile(
            leading: const Icon(Icons.photo_library_rounded),
            title: const Text('Gallery ekstrakurikuler'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/galery');
            },
          ),
        ],
      ),
    );
  }
}