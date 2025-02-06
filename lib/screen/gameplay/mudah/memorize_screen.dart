import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import 'dart:async';
import 'dart:math';
import 'package:fish_flash/data/hewan_data.dart'; // Import the hewan data
import 'result.dart'; // Import the result page

class MemorizeWidget extends StatefulWidget {
  const MemorizeWidget({super.key});

  @override
  _MemorizeWidgetState createState() => _MemorizeWidgetState();
}

class _MemorizeWidgetState extends State<MemorizeWidget> {
  int _counter = 10;
  Timer? _timer;
  late List<Widget> _randomImages;
  final Map<String, int> _imageCounts = {};
  bool _timerEnded = false;
  late String _randomHewanName;
  late int _correctAnswer;
  late List<int> _options;
  String? _resultImage;
  int? _selectedOption;
  bool _isAnswered = false;
  bool _showImagesWithCircle = false;
  bool _showQuestion = false;
  bool _showPertanyaanImage = false;
  final List<Map<String, dynamic>> _imageDetails = [];

  @override
  void initState() {
    super.initState();
    _randomImages = _generateRandomImages();
    _startTimer();
    _printImageCounts();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer?.cancel();
        setState(() {
          _timerEnded = true;
          _showPertanyaanImage = true;
        });

        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            _showPertanyaanImage = false;
            _showQuestion = true;
            _generateOptions();
          });
        });
      }
    });
  }

  void _printImageCounts() {
    _imageCounts.forEach((key, value) {
      print('$key: $value');
    });
  }

  void _generateOptions() {
    _correctAnswer = _imageCounts[_randomHewanName] ?? 0;
    _options = [_correctAnswer];
    final random = Random();

    while (_options.length < 3) {
      int option = random.nextInt(10) + 1;
      if (!_options.contains(option)) {
        _options.add(option);
      }
    }

    _options.shuffle();
  }

  void _checkAnswer(int selectedOption) {
    if (_isAnswered) return; // Prevent multiple answers
    setState(() {
      _selectedOption = selectedOption;
      _isAnswered = true;
      if (selectedOption == _correctAnswer) {
        _resultImage = 'assets/Benar.png';
      } else {
        _resultImage = 'assets/Salah.png';
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _showImagesWithCircle = true;
      });

      // ngarahin hasil lalu ditampilkan ke result,dart setelah 3 detik
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              hewanName: _randomHewanName,
              imageCount: _imageCounts[_randomHewanName] ?? 0,
              userChoice: _selectedOption ?? 0,
            ),
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _timerEnded
          ? _showImagesWithCircle
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 1200,
                      height: 600,
                      child: Stack(
                        children: _generateRandomImages(withCircle: true),
                      ),
                    ),
                  ],
                )
              : _showPertanyaanImage
                  ? Center(
                      child: SizedBox(
                        width: 700, // Set the desired width
                        height: 300, // Set the desired height
                        child: Image.asset('assets/pertanyaan.png'),
                      ),
                    )
                  : _showQuestion
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 600,
                              height: 100,
                              child: Center(
                                child: Image.asset('assets/sesipertanyaan.png'),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox( // container 2
                              width: 450,
                              height: 120,
                              child: Center(
                                child: Center(
                                  child: Image.asset(
                                    _getSoalImagePath(_randomHewanName),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 1200,
                              height: 300,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: _options.map((option) {
                                  return GestureDetector(
                                    onTap: _isAnswered ? null : () => _checkAnswer(option),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: _selectedOption == option
                                              ? (_selectedOption == _correctAnswer
                                                  ? const Color.fromARGB(255, 120, 179, 255)
                                                  : const Color(0xFFFF9595))
                                              : Colors.transparent,
                                          width: 10, // Set the border thickness here
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0), // Space between border and button
                                        child: Container(
                                          width: 200,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: _selectedOption == option && option != _correctAnswer
                                                ? const Color(0xFFFF9595)
                                                : const Color.fromARGB(255, 120, 179, 255),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '$option',
                                              style: const TextStyle(
                                                fontSize: 35,
                                                fontFamily: 'Super Bubble',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 20), 
                            SizedBox(
                              width: 200,
                              height: 100,
                              child: Center(
                                child: _resultImage != null
                                    ? Image.asset(_resultImage!)
                                    : Container(),
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: Image.asset('assets/pertanyaan.png'),
                        )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: StrokeText(
                      text: '$_counter',
                      textStyle: const TextStyle(
                        fontSize: 50,
                        fontFamily: 'Super Bubble',
                        color: Colors.white,
                      ),
                      strokeColor: const Color.fromARGB(255, 72, 148, 247),
                      strokeWidth: 10,
                    ),
                  ),
                ),
                const SizedBox(height: 20), 
                SizedBox(
                  width: 1200,
                  height: 600,
                  child: Stack(
                    children: _randomImages,
                  ),
                ),
              ],
            ),
    );
  }

  List<Widget> _generateRandomImages({bool withCircle = false}) {
    final random = Random();
    final List<Widget> imageWidgets = [];
    const double imageSize = 100;

    if (_imageDetails.isEmpty) {
      for (int i = 0; i < 15; i++) {
        final hewan = hewanFigures[random.nextInt(min(10, hewanFigures.length))]; // Range random dari 1-10 atau panjang daftar
        final image = hewan['image']!;
        final name = hewan['name']!;
        if (i == 0) {
          _randomHewanName = name; // Set random nama ikan buat soal
        }
        double left, top;
        Rect newRect;

        do {
          left = random.nextDouble() * (1200 - imageSize);
          top = random.nextDouble() * (600 - imageSize);
          newRect = Rect.fromLTWH(left, top, imageSize, imageSize);
        } while (_imageDetails.any((detail) => Rect.fromLTWH(detail['left'], detail['top'], imageSize, imageSize).overlaps(newRect)));

        final rotationAngle = (random.nextDouble() - 0.5) * (pi / 3);

        _imageDetails.add({
          'image': image,
          'name': name,
          'left': left,
          'top': top,
          'rotationAngle': rotationAngle,
        });

        // Count the number of each animal
        if (_imageCounts.containsKey(name)) {
          _imageCounts[name] = _imageCounts[name]! + 1;
        } else {
          _imageCounts[name] = 1;
        }
      }
    }

    for (var detail in _imageDetails) {
      imageWidgets.add(Positioned(
        left: detail['left'],
        top: detail['top'],
        child: Stack(
          children: [
            Transform.rotate(
              angle: detail['rotationAngle'],
              child: Image.asset(
                detail['image'],
                width: imageSize,
                height: imageSize,
              ),
            ),
            if (withCircle && detail['name'] == _randomHewanName)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 5),
                  ),
                ),
              ),
          ],
        ),
      ));
    }

    return imageWidgets;
  }

  String _getSoalImagePath(String hewanName) {
    final hewan = hewanFigures.firstWhere((element) => element['name'] == hewanName);
    return hewan['soal']!;
  }
}