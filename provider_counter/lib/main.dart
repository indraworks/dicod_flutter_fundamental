import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
1)Model state 
nama class counternya adlah class CounterNotifier extends ChangeNofitier
class  counter ini menyimpan nilai _counter dan metode yang mengubahnya .
Ia mewarisi ChangeNotifier,sehingga bisa memeberitahu UI ketika data berubah 

*/

class CounterNotifier extends ChangeNotifier {
  int _count = 0;
  //getter
  int get count => _count;

  //tambah nilai counter stlah berubah baru beritahu UI agar rebuild tampilanya (agar berubah)
  void increment() {
    _count++;
    notifyListeners(); //lewat sini beritahu UInya agar tampilan berubah /merender
    //karena ada perubahan counter
  }

  //reset ke nol dan beritahu UI agar tampilanya berubah juga
  void reset() {
    _count = 0;
    notifyListeners(); //memeberi tahu sluruh widget karena ada counter yg reset!
  }
}

void main() {
  runApp(
    /*
   ChangeNotifierProvider dalah sebuah function yamng mana berisi variable object kembalian dari 
   function yg mana berupa instance dari class counterNotifer isinya adalah notiferListiner dan _count 
   kembaliannya  
   nah dia ini di buat wraping di const MyApp agar smua anak2 widget dapat notifikasi jika ada 
   state berubah lewat notifyListener() 
   jadi kita buat di dalam runAPp() didalam kurungnya 

  */
    ChangeNotifierProvider(
      create: (_) => CounterNotifier(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  //Ini adalah akar aplikasi tidak perlu tahu detaul tapi dapat notifikasi

  @override
  Widget build(BuildContext context) {
    /*
     dibawah ini mnggunakan context.watch<T>() 
     untk mengambil nilai count dan mmbuat widget rebuilt saat berubah !
     disini widgetnya adalah scafold jadi ini satu halaman penuh yg rebuild
    */

    final counter = context
        .watch<CounterNotifier>(); //// Watch the CounterNotifier instance
    final count = counter.count; //access the count properly from the getter

    return Scaffold(
      appBar: AppBar(title: const Text('FLutter default Counter + Provider')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Kamu Menekan tombol sebanyak :',
              style: TextStyle(fontSize: 16),
            ),
            //Text Ini akan rebuild ketika count berubag  karena kita pakai wathcg
            Text('$count', style: Theme.of(context).textTheme.displayMedium),
            SizedBox(height: 24),
            //4) Consumer sebgai alternatif
            //consumer mmberi builder pada widget pada baigan ini saja yg direbuilt
            //jika statenya berubah
            //'Status : ${counter.count % 2 == 0 ? "Genap" : "Ganjil"}',
            Consumer<CounterNotifier>(
              builder: (context, counter, child) {
                // 'counter' is the instance of CounterNotifier
                return Text(
                  'Status : ${counter.count % 2 == 0 ? "Genap" : "Ganjil"}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            // 5) Selector UNTUK OPTIMALISASI
            //Selector hanya "mendengarkan" potongann tertentu dari state.
            //
            //
            //
            Selector<CounterNotifier, bool>(
              selector: (_, counter) => counter.count >= 10,
              builder: (context, isBig, child) {
                return AnimatedOpacity(
                  opacity: isBig ? 1 : 0.3,
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    isBig ? 'Great !sudah > 12 ' : 'Ayo Teken Lagi!',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      //ini dibawah center masih dalam scafold
      /// 6) AKSI MENGGUNAKAN read()
      /// Di event handler seperti onPressed, gunakan read() agar tidak memicu rebuild.
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min, //luasan kiri kanannya dipakai column
        //hanya paling minim gak semua!
        children: [
          FloatingActionButton.extended(
            heroTag: 'inc',
            onPressed: () {
              //ambil provider tanpa subcribe keprubahan
              context
                  .read<CounterNotifier>()
                  .increment(); //baca increment func dari class CountNotifier
            },
            label: Text('Tambah'),
            icon: const Icon(Icons.add),
          ),
          SizedBox(height: 12),
          FloatingActionButton.extended(
            heroTag: 'Reset',
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
