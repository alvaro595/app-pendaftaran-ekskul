import 'package:flutter/material.dart';

class DataPege {
  String nama;
  String nis;
  String kelas;
  String noWa;
  String gender;
  List<String> ekstrakulikuler;

  DataPege({
    required this.nama,
    required this.nis,
    required this.kelas,
    required this.noWa,
    required this.gender,
    required this.ekstrakulikuler,
  });
}

// Data pendaftaran
List<DataPege> dataPendaftaran = [];
class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() =>
      _DataPendaftaranPageState();
}
class _DataPendaftaranPageState
    extends State<DataPage> {
  // Fungsi untuk refresh data
  void refreshData() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Hasil Pendaftaran',
        ),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,

        actions: [
          IconButton(
            onPressed: refreshData,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),

      drawer: const AppDrawer(),
      body: dataPendaftaran.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inbox,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 15),

                  Text(
                    'Belum ada data pendaftaran.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )

          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: dataPendaftaran.length,

              itemBuilder: (context, index) {
                final data = dataPendaftaran[index];
                return Card(
                  margin: const EdgeInsets.only(
                    bottom: 15,
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        // NAMA
                        Row(
                          children: [
                            const CircleAvatar(
                              child: Icon(
                                Icons.person,
                              ),
                            ),

                            const SizedBox(
                              width: 12,
                            ),

                            Expanded(
                              child: Text(
                                data.nama,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Divider(
                          height: 25,
                        ),
                        // NIS
                        Text(
                          'NIS: ${data.nis}',
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        // KELAS
                        Text(
                          'Kelas: ${data.kelas}',
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        // NO WA
                        Text(
                          'No. WhatsApp: ${data.noWa}',
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        // GENDER
                        Text(
                          'Jenis Kelamin: '
                          '${data.gender}',
                        ),

                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Ekstrakurikuler:',
                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // EKSKUL
                        Wrap(
                          spacing: 5,
                          runSpacing: 5,

                          children: data
                              .ekstrakulikuler
                              .map(
                                (item) => Chip(
                                  label: Text(item),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
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