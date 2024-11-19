# megamendung_mobile

Aplikasi untuk jualan Batik menggunakan Flutter.

## TI 7: Elemen Dasar Flutter

### Q1: Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
- **Stateless widget**: Widget yang selalu konstan selama siklus hidupnya. Setelah dibuat, widget ini tidak dapat berubah lagi, cocok untuk elemen statis seperti `Text`, `Icon`, dan `IconButton`.
- **Stateful widget**: Widget yang dapat berubah selama siklus hidupnya, bergantung pada interaksi pengguna atau data yang di-update. Contoh: `Checkbox`, `Radio`, `Slider`, `TextField`.
- **Perbedaan utama**: Stateless widget memiliki keadaan tetap, sedangkan stateful widget memiliki keadaan dinamis. Stateful widget membutuhkan dua kelas (`StatefulWidget` dan `State`), sedangkan stateless widget hanya butuh satu kelas (`StatelessWidget`).

### Q2: Widget yang Digunakan pada Proyek ini
- **Scaffold**: Struktur dasar layout aplikasi.
- **AppBar**: Bar di bagian atas layout, biasanya berisi judul atau navbar.
- **Container**: Mengatur padding, margin, background color, dll.
- **Padding**: Memberi ruang kosong di sekitar widget child.
- **Column**: Mengatur tata letak child widget secara vertikal.
- **Row**: Mengatur tata letak child widget secara horizontal.
- **InfoCard**: Menampilkan informasi seperti NPM, Nama, Kelas dalam bentuk card.
- **Center**: Menempatkan widget di tengah area.
- **Text**: Menampilkan teks statis atau dinamis.
- **ItemCard**: Menampilkan tombol navigasi dengan ikon dan teks serta menangani interaksi pengguna.
- **Material**: Memberi tampilan Material Design untuk widget.

### Q3: Apa fungsi dari setState()?
- **setState()** digunakan untuk memberitahu framework bahwa state dari widget sudah berubah sehingga perlu rebuild UI. Misalnya, variabel `_counter` pada widget `CounterBar` di-increment atau decrement, dan `setState()` memungkinkan perubahan tersebut ditampilkan.

### Q4: Perbedaan antara const dan final
- `const` diinisialisasi pada compile time, digunakan untuk optimisasi widget yang tidak berubah.
- `final` diinisialisasi saat runtime; nilainya tetap setelah diinisialisasi tetapi tidak seoptimal `const` dalam konteks build.

### Q5: Implementasi Checklist-Checklist

1. **Membuat Proyek Flutter**:
   - Mulai dengan membuat proyek Flutter baru:
     ```bash
     flutter create megamendung-mobile
     ```

2. **Membuat Tombol dengan Ikon dan Teks**:
   - Buat kelas `ItemHomepage` untuk menyimpan data setiap tombol.
     ```dart
     class ItemHomepage {
       final String name;
       final IconData icon;
       final Color color;

       ItemHomepage(this.name, this.icon, this.color);
     }
     ```

   - Buat daftar `items` yang berisi tombol-tombol yang akan ditampilkan:
     ```dart
     final List<ItemHomepage> items = [
       ItemHomepage("Lihat Daftar Batik", Icons.list_alt, Colors.blue),
       ItemHomepage("Tambah Batik", Icons.add_box, Colors.green),
       ItemHomepage("Logout", Icons.logout, Colors.red),
     ];
     ```

   - Buat widget `ItemCard` untuk menampilkan tombol dengan ikon dan teks:
     ```dart
     class ItemCard extends StatelessWidget {
       final ItemHomepage item;

       const ItemCard(this.item, {Key? key}) : super(key: key);

       @override
       Widget build(BuildContext context) {
         return Material(
           color: item.color,
           borderRadius: BorderRadius.circular(12),
           child: InkWell(
             onTap: () {
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
                     Icon(item.icon, color: Colors.white, size: 30.0),
                     const SizedBox(height: 5),
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
     ```

   - Tampilkan tombol-tombol tersebut dalam `GridView`:
     ```dart
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
     );
     ```
     Dengan menggunakan GridView.count, saya dapat menyusun tombol-tombol dalam grid yang rapi dan responsif. Properti shrinkWrap: true memastikan bahwa GridView hanya mengambil ruang yang diperlukan sesuai dengan jumlah tombol yang ada.

3. **Untuk meningkatkan estetika dan memberikan identitas visual yang unik pada setiap tombol, saya menerapkan warna yang berbeda untuk masing-masing tombol.**:
   Untuk memberikan estetika yang menarik, setiap tombol diberi warna yang berbeda sesuai dengan fungsinya. Berikut ini langkah-langkahnya:

a. **Menambahkan Atribut Warna pada ItemHomepage**  
   - Pada kelas `ItemHomepage`, tambahkan atribut `color` yang menentukan warna latar belakang tombol:
     ```dart
     class ItemHomepage {
       final String name;      // Nama tombol.
       final IconData icon;    // Ikon tombol.
       final Color color;      // Warna latar belakang tombol.

       ItemHomepage(this.name, this.icon, this.color);
     }
     ```
   
   - Setiap tombol diberi warna berbeda sesuai dengan daftar `items`:
     ```dart
     final List<ItemHomepage> items = [
       ItemHomepage("Lihat Daftar Batik", Icons.list_alt, Colors.blue),
       ItemHomepage("Tambah Batik", Icons.add_box, Colors.green),
       ItemHomepage("Logout", Icons.logout, Colors.red),
     ];
     ```

b. **Menggunakan Warna dalam ItemCard**  
   - Di widget `ItemCard`, atribut `color` dari setiap objek `ItemHomepage` digunakan untuk menentukan warna latar belakang tombol:
     ```dart
     class ItemCard extends StatelessWidget {
       final ItemHomepage item;

       const ItemCard(this.item, {Key? key}) : super(key: key);

       @override
       Widget build(BuildContext context) {
         return Material(
           color: item.color, // Menggunakan warna dari item.
           borderRadius: BorderRadius.circular(12),
           child: InkWell(
             onTap: () {
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
                     Icon(item.icon, color: Colors.white, size: 30.0),
                     const SizedBox(height: 5),
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
     ```
   
Dengan pendekatan ini, setiap tombol di aplikasi memiliki warna latar yang unik, yang membantu memberikan identitas visual yang kuat dan membuatnya lebih menarik.

4. **Untuk memberikan umpan balik langsung kepada pengguna saat mereka menekan salah satu tombol, saya mengimplementasikan SnackBar yang muncul dengan pesan yang sesuai.**:
Untuk memberikan umpan balik langsung kepada pengguna saat tombol ditekan, SnackBar diimplementasikan di dalam widget `ItemCard`.

a. **Implementasi SnackBar dalam ItemCard**  
   - Gunakan `InkWell` untuk menangani tap pada tombol dan tampilkan SnackBar dengan pesan yang sesuai.
   - Kode berikut menampilkan SnackBar dengan pesan berdasarkan nama tombol yang ditekan:
     ```dart
     InkWell(
       onTap: () {
         // Menampilkan Snackbar sesuai dengan nama tombol.
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
               Icon(item.icon, color: Colors.white, size: 30.0),
               const SizedBox(height: 5),
               Text(
                 item.name,
                 textAlign: TextAlign.center,
                 style: const TextStyle(color: Colors.white),
               ),
             ],
           ),
         ),
       ),
     );
     ```

## TI 8: Flutter Navigation, Layouts, Forms, and Input Elements

### Q1: Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
"const" dipakai untuk menampung nilai yang sifatnya konstan/tetap selama runtime. Keuntungannya adalah variabel tersebut tidak perlu di-render lagi sehingga aplikasi kita bisa lebih ringan dan responsif. "const" sebaiknya digunakan ketika nilai tersebut tidak tergantung pada kondisi runtime yang dinamis, misalnya konstanta pi pada matematika dan lainnya yang tidak mungkin berubah.

### Q2: Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
Column digunakan untuk menyusun widget secara vertikal, sementara Row untuk menyusun widget secara horizontal.
Contoh implementasi Column:
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
);
```

Contoh implementasi Row:
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Icon(Icons.star),
    Icon(Icons.star_border),
    Icon(Icons.star_half),
  ],
);
```

### Q3: Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Untuk sekarang, saya baru mengimplementasikan TextFormField saja sebagai elemen input. Saya menggunakan TextFormField ini karena dua alasan utama, yaitu memang sebagian besar tipe data yang diharapkan adalah teks serta untuk tipe data yang sebenarnya seharusnya berupa bilangan, TextFormField meningkatkan keleluasaan saya untuk melakukan manipulasi dengan lebih baik di masa yang akan datang. 
Elemen input Flutter lain yang saya belum gunakan pada tugas ini adalah Checkbox (untuk memilih beberapa preferensi yang lebih dari satu), Radio (untuk membuat salah satu pilihan saja), Slider (untuk memilih nilai dalam range tertentu), DatePicker (untuk masukan waktu tanggal-bulan-tahun), DropdownButtonFormField (untuk pilihan dropdown), dan lain-lain.

### Q4: Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Saya mengatur tema pada aplikasi saya dengan mengatur ThemeData pada MaterialApp yang ada di file 'main.dart'. Di sinilah saya mengatur konfigurasi warna dengan men-define ColorScheme. Saya menggunakan warna deepPurple sebagai warna primer yang dengan primarySwatch akan menciptakan shades berwarna deepPurple yang bervariasi dari terang ke gelap dengan warna sekunder yakni deepPurple[400] yang berarti warna deepPurple yang sedang (mid-range shades).
Ya, saya mengimplementasikannya dengan kode berikut.
```dart
theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(secondary: Colors.deepPurple[400]),
)
```

### Q5: Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Pertama, saya buat sidebar (drawer) untuk memudahkan pengguna dalam bernavigasi di seluruh bagian aplikasi. Sidebar ini berisi beberapa opsi yang mengarah ke halaman-halaman tertentu, seperti halaman utama (home) dan halaman form untuk menambah batik. Kedua, saya mengatur masing-masing pilihan pada sidebar dengan fungsi Navigator. Untuk halaman utama, saya menggunakan Navigator.pushReplacement, yang fungsinya mengganti halaman saat ini dengan halaman home, sehingga halaman ini akan menjadi halaman utama yang "permanen" dalam stack. Artinya, ketika user kembali ke halaman sebelumnya, halaman utama tetap berada di posisi atas pada stack, tanpa menyimpan halaman-halaman lain di bawahnya. Sedangkan untuk halaman lain, seperti form entry, saya pakai Navigator.push biasa sehingga ketika user sudah selesai di halaman tersebut dan menekan tombol back, halaman itu langsung keluar dari stack page. Ini memungkinkan user untuk kembali ke halaman sebelumnya tanpa masalah.


## TI 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

### Q1: Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

### Q2: Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini

### Q3: Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

### Q4: Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

### Q5: Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

### Q6: Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!