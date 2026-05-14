# Laporan Pertemuan 7 (#9)

## Identitas Mahasiswa

| Atribut | Nilai                  |
| ------- | ---------------------- |
| Nama    | Aurellia Mezaluna Azwa |
| NIM     | 244107060021           |
| Kelas   | SIB-2D                 |

## Praktikum 1 - Langkah 1

Buatlah sebuah project flutter baru dengan nama kamera_flutter, lalu sesuaikan style laporan praktikum yang Anda buat.

![Langkah 1](img/prak1/lk1.png)

## Praktikum 1 - Langkah 2

Untuk menambahkan dependensi plugin, jalankan perintah flutter pub add seperti berikut di terminal:

**Output**

![Langkah 2](img/prak1/lk2.png)

## Praktikum 1 - Langkah 3

Selanjutnya, kita perlu mengecek jumlah kamera yang tersedia pada perangkat menggunakan plugin camera seperti pada kode berikut ini. Kode ini letakkan dalam void main().

**Output**

![Langkah 3](img/prak1/lk3.png)

## Praktikum 1 - Langkah 4

Setelah Anda dapat mengakses kamera, gunakan langkah-langkah berikut untuk membuat dan menginisialisasi CameraController. Pada langkah berikut ini, Anda akan membuat koneksi ke kamera perangkat yang memungkinkan Anda untuk mengontrol kamera dan menampilkan pratinjau umpan kamera.

**Output**

```dart
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

## Praktikum 1 - Langkah 5

Gunakan widget CameraPreview dari package camera untuk menampilkan preview foto. Anda perlu tipe objek void berupa FutureBuilder untuk menangani proses async.

**Output**

![Langkah 5](img/prak1/lk5.png)

## Praktikum 1 - Langkah 6

Membuat sebuah FloatingActionButton yang digunakan untuk mengambil gambar menggunakan CameraController saat pengguna mengetuk tombol.

Pengambilan gambar memerlukan 2 langkah:

1. Pastikan kamera telah diinisialisasi.
2. Gunakan controller untuk mengambil gambar dan pastikan ia mengembalikan objek Future.

**Output**

![Langkah 6](img/prak1/lk6.png)

![OUTPUT LANGKAH 6](img/prak1/op6.jpeg)

![OUTPUT LANGKAH 6](img/prak1/op6.1.jpeg)

## Praktikum 1 - Langkah 7

Membuat file baru pada folder widget.

```dart
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - NIM Anda')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
```

## Praktikum 1 - Langkah 8

Mengedit pada file ini bagian runApp

![Langkah 8](img/prak1/lk8.png)

## Praktikum 1 - Langkah 9

Menambahkan kode seperti berikut pada bagian try / catch agar dapat menampilkan hasil foto pada DisplayPictureScreen.

![Langkah 9](img/prak1/lk9.png)

![OUTPUT LANGKAH 9](img/prak1/op9.jpeg)
