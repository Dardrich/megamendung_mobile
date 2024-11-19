// screens/menu.dart
import 'package:flutter/material.dart';
import 'package:megamendung_mobile/widgets/item_cart.dart';
import 'package:megamendung_mobile/widgets/left_drawer.dart';
import 'package:megamendung_mobile/screens/itementry_form.dart';

class MyHomePage extends StatelessWidget {
  final List<ItemHomepage> items = [
    ItemHomepage(
      "Lihat Daftar Batik",
      Icons.list_alt,
      Colors.blue,
    ),
    ItemHomepage(
      "Tambah Batik",
      Icons.add_box,
      Colors.green,
    ),
    ItemHomepage(
      "Logout",
      Icons.logout,
      Colors.red,
    ),
  ];

  final String npm = '2306206856';
  final String name = 'Darren Aldrich';
  final String className = 'PBP F';

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'megamendung',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to megamendung',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

// class ItemHomepage {
//   final String title;
//   final IconData icon;
//   final Color color;

//   ItemHomepage(this.title, this.icon, this.color);
// }

// class ItemCard extends StatelessWidget {
//   final ItemHomepage item;

//   const ItemCard(this.item, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Kamu telah menekan tombol ${item.title}!'),
//             duration: Duration(seconds: 2),
//           ),
//         );

//         if (item.title == "Tambah Batik") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const ProductEntryFormPage()),
//           );
//         }
//       },
//       child: Card(
//         color: item.color,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(item.icon, size: 40, color: Colors.white),
//             const SizedBox(height: 10),
//             Text(
//               item.title,
//               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
