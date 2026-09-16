import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> galleryItems = [
      {
        'title': 'Futsal',
        'category': 'Ekstrakurikuler Olahraga',
        'image': 'assets/images/futsa.png',
      },
      {
        'title': 'Basket',
        'category': 'Ekstrakurikuler Olahraga',
        'image': 'assets/images/basket.jpg',
      },
      {
        'title': 'Paskibra',
        'category': 'Ekstrakurikuler Kedisiplinan',
        'image': 'assets/images/paskriba.jpg',
      },
      {
        'title': 'Robotik',
        'category': 'Ekstrakurikuler Teknologi',
        'image': 'assets/images/robotik.jpg',
      },
      {
        'title': 'Tari',
        'category': 'Ekstrakurikuler Seni',
        'image': 'assets/images/tari.jpg',
      },
      {
        'title': 'Taekwondo',
        'category': 'Ekstrakurikuler Bela Diri',
        'image': 'assets/images/Taekwondo.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Galeri Ekstrakurikuler',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          // HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.collections_bookmark_rounded,
                  size: 50,
                  color: Colors.white,
                ),

                SizedBox(height: 10),

                Text(
                  'Galeri Kegiatan',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),

                Text(
                  'Kumpulan kegiatan ekstrakurikuler SMKN 64 Jakarta.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          // GRID GALERI
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15,0,),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: galleryItems.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final item = galleryItems[index];
                  return _buildGalleryCard(
                    item['image']!,
                    item['title']!,
                    item['category']!,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  // CARD GALERI
  Widget _buildGalleryCard(
    String imageUrl,
    String title,
    String category,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),

        child: Stack(
          fit: StackFit.expand,
          children: [
            // GAMBAR
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (
                context,
                error,
                stackTrace,
              ) {
                return Container(
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Icon(
                      Icons.broken_image_rounded,
                      color: Colors.grey,
                      size: 35,
                    ),
                  ),
                );
              },
            ),
            // GRADIENT
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,

              child: Container(
                height: 85,

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black87,
                      Colors.black54,
                      Colors.transparent,
                    ],
                  ),
                ),

                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),

                    Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            // EFEK KLIK
            Material(
              color: Colors.transparent,

              child: InkWell(
                onTap: () {
                  // Bisa ditambahkan aksi
                  // untuk membuka gambar full screen
                },
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