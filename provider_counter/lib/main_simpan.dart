import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 1) MODEL/STATE
/// Kelas Counter ini menyimpan nilai _count dan metode untuk mengubahnya.
/// Ia mewarisi ChangeNotifier, sehingga bisa memberi tahu UI ketika data berubah.
class CounterNotifier extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  /// Tambah nilai lalu beri tahu pendengar (UI) agar rebuild.
  void increment() {
    _count++;
    notifyListeners();
  }

  /// Reset ke nol sebagai contoh aksi lain.
  void reset() {
    _count = 0;
    notifyListeners();
  }
}

void main() {
  runApp(
    /// 2) REGISTER PROVIDER DI ROOT
    /// ChangeNotifierProvider membuat instance CounterNotifier dan
    /// menaruhnya di atas widget tree sehingga bisa diakses lewat context.
    ChangeNotifierProvider(
      create: (_) => CounterNotifier(),
      child: const MyApp(),
    ),
  );
}

/// Akar aplikasi (tidak perlu tahu detail state).
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter with Provider',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

/// Halaman utama (UI) yang menampilkan nilai counter dan tombol aksi.
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// 3) MENDENGARKAN STATE
    /// Ada beberapa cara. Di bawah ini contoh memakai context.watch<T>()
    /// untuk mengambil nilai count dan membuat widget rebuild saat berubah.
    final count = context.watch<CounterNotifier>().count;

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Default Counter + Provider')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Kamu telah menekan tombol sebanyak:',
              style: TextStyle(fontSize: 16),
            ),

            /// Teks ini akan rebuild ketika count berubah karena kita pakai watch.
            Text('$count', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 24),

            /// 4) CONSUMER SEBAGAI ALTERNATIF
            /// Consumer memberi builder yang hanya rebuild bagian ini saat state berubah.
            Consumer<CounterNotifier>(
              builder: (context, counter, child) {
                return Text(
                  'Status: ${counter.count % 2 == 0 ? "Genap" : "Ganjil"}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            /// 5) SELECTOR UNTUK OPTIMALISASI
            /// Selector hanya “mendengarkan” potongan tertentu dari state.
            Selector<CounterNotifier, bool>(
              selector: (_, counter) => counter.count >= 10,
              builder: (context, isBig, child) {
                return AnimatedOpacity(
                  opacity: isBig ? 1 : 0.3,
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    isBig ? 'Great! Sudah >= 10 🎉' : 'Ayo tekan lagi!',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      /// 6) AKSI MENGGUNAKAN read()
      /// Di event handler seperti onPressed, gunakan read() agar tidak memicu rebuild.
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            heroTag: 'inc',
            onPressed: () {
              // Ambil provider tanpa subscribe ke perubahan:
              context.read<CounterNotifier>().increment();
            },
            label: const Text('Tambah'),
            icon: const Icon(Icons.add),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            heroTag: 'reset',
            onPressed: () {
              context.read<CounterNotifier>().reset();
            },
            label: const Text('Reset'),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
