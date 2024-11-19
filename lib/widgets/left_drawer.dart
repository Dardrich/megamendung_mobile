import 'package:flutter/material.dart';
import 'package:megamendung_mobile/screens/list_itementry.dart';
import 'package:megamendung_mobile/screens/menu.dart';
import 'package:megamendung_mobile/screens/itementry_form.dart';
// TODO: Impor halaman ProductEntryFormPage jika sudah dibuat

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            // TODO: Bagian drawer header
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'megamendung',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Lestarikan budaya bangsa dengan megamendung!",
                  // TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // TODO: Bagian routing
          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('Daftar Batik'),
            onTap: () {
              // Route menu ke halaman product
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductEntryPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.cake_rounded),
            title: const Text('Tambah Batik'),
            // Bagian redirection ke ProductEntryFormPage
            onTap: () {
              /*
                  TODO: Buatlah routing ke ProductEntryFormPage di sini,
                  setelah halaman ProductEntryFormPage sudah dibuat.
                  */
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductEntryFormPage()));
            },
          ),
        ],
      ),
    );
  }
}
