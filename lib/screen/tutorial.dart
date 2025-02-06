import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100.0, // Atur tinggi kontainer atas
                width: 440.0, // Atur lebar kontainer atas
                child: const Center(
                  child: StrokeText(
                    text: 'CARA BERMAIN',
                    textStyle: TextStyle(
                      fontSize: 50.0, // Ukuran teks lebih besar
                      fontFamily: 'Super Bubble', // Font Super Bubble
                      color: Colors.white
                    ),
                    strokeColor: Color.fromARGB(255, 72, 148, 247),
                    strokeWidth: 10,

                  )
                ),
              ),
              Container(
                height: 500.0, // Atur tinggi kontainer tengah
                width: 1000.0, // Atur lebar kontainer tengah
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0), // Jarak antara judul dan daftar
                      Text(
                        '1. Awal permainan, pemain akan memasuki sesi mengingat.',
                        style: TextStyle(
                          fontSize: 35.0, // Ukuran teks lebih besar
                          fontFamily: 'Super Bubble', // Font Super Bubble
                          color: Color.fromARGB(255, 0, 30, 70)
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        '2. Pemain di berikan beberapa jenis hewan laut yang di acak, pemain akan di berikan beberapa detik untuk mengingat.',
                        style: TextStyle(
                          fontSize: 35.0, // Ukuran teks lebih besar
                          fontFamily: 'Super Bubble', // Font Super Bubble
                          color: Color.fromARGB(255, 0, 30, 70)
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        '3. Setelah sesi mengingat, pemain akan memasuki sesi pertanyaan yang berkaitan dengan ikan tadi. Pemain harus menjawab dengan tepat.',
                        style: TextStyle(
                          fontSize: 27.0, // Ukuran teks lebih besar
                          fontFamily: 'Super Bubble', // Font Super Bubble
                          color: Color.fromARGB(255, 0, 30, 70)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0), // Jarak antara kontainer tengah dan tombol
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0), // Atur ukuran tombol
                ),
                child: const Text(
                  'Keluar',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 18.0,
                    fontFamily: 'Super Bubble', // Font Super Bubble
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