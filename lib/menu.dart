import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  // Updated items list with new labels, icons, and colors.
  final List<ItemHomepage> items = [
    ItemHomepage(
      "Lihat Daftar Batik",
      Icons.list_alt, // Icon representing a list of products.
      Colors.blue,    // Blue color for "View Product List".
    ),
    ItemHomepage(
      "Tambah Batik",
      Icons.add_box,  // Icon representing adding a product.
      Colors.green,   // Green color for "Add Product".
    ),
    ItemHomepage(
      "Logout",
      Icons.logout,   // Icon representing logout.
      Colors.red,     // Red color for "Logout".
    ),
  ];

  final String npm = '2306206856';
  final String name = 'Darren Aldrich';
  final String className = 'PBP F';

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar remains the same.
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // InfoCards remain the same.
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
                  // Updated GridView with new buttons.
                  GridView.count(
                    primary: false, // Set to false to prevent scrolling conflicts.
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
  final String title;    // Title of the info card.
  final String content;  // Content of the info card.

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

class ItemHomepage {
  final String name;      // Name of the button.
  final IconData icon;    // Icon of the button.
  final Color color;      // Background color of the button.

  ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item; // The item to display.

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Use the color from the item.
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          // Display the corresponding Snackbar message.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!"),
                duration: const Duration(seconds: 2),
              ),
            );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
