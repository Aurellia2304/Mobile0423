# TUGAS PRAKTIKUM

## Identitas Mahasiswa

| Atribut | Nilai                  |
| ------- | ---------------------- |
| Nama    | Aurellia Mezaluna Azwa |
| NIM     | 244107060021           |
| Kelas   | SIB-2D                 |

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Membuat proyek baru

Pada panel sebelah kiri VS Code, pastikan bahwa Penjelajah dipilih lalu buka file pubspec.yaml. Kemudian ganti konten file.

![Tugas Praktikum](img/tprak/pb1.png)

![Tugas Praktikum](img/tprak/pb2.png)

![Tugas Praktikum](img/tprak/pb3.png)

## Mengganti isi main

![Tugas Praktikum](img/tprak/main1.png)

## Hot Reload Pertama

**Output**

![Tugas Praktikum](img/tprak/tbm1.jpeg)

![Tugas Praktikum](img/tprak/tbm2.jpeg)

## Menambahkan tombol

![Tugas Praktikum](img/tprak/tombol1.png)

**Output**

![Tugas Praktikum](img/tprak/tbl1.jpeg)

## Menambahkan kartu

```dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;                 // ← Add this.

    return Scaffold(
      body: Column(
        children: [
          Text('A random AWESOME idea:'),
          Text(pair.asLowerCase),                // ← Change to this.
          ElevatedButton(
            onPressed: () {
              appState.getNext();
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
```

**Output**

![Tugas Praktikum](img/tprak/kartu1.jpeg)

## Menambahkan kelas bigcard

![Tugas Praktikum](img/tprak/bgc1.png)

![Tugas Praktikum](img/tprak/bgc2.png)

![Tugas Praktikum](img/tprak/bgc3.png)

**Output**

![Tugas Praktikum](img/tprak/bgc4.jpeg)

## Tema dan Gaya

```dart
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);       // ← Add this.

    return Card(
      color: theme.colorScheme.primary,    // ← And also this.
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(pair.asLowerCase),
      ),
    );
  }
```

**Output**

![Tugas Praktikum](img/tprak/bgc5.jpeg)

## Tema Text

Kartu tersebut masih memiliki masalah: ukuran teks terlalu kecil dan warnanya membuat teks sulit dibaca. Untuk memperbaiki masalah ini, buat perubahan berikut pada metode build() BigCard.

```dart
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // ↓ Add this.
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        // ↓ Change this line.
        child: Text(pair.asLowerCase, style: style),
      ),
    );
  }
```

**Output**

![Tugas Praktikum](img/tprak/bgc6.jpeg)

## Menempatkan UI di tengah

![Tugas Praktikum](img/tprak/ui1.png)

**Output**

![Tugas Praktikum](img/tprak/center1.jpeg)

## Menambahkan tombol

![Tugas Praktikum](img/tprak/tbm3.png)

**Output**

![Tugas Praktikum](img/tprak/opt1.jpeg)

## Menambahkan tombol love

![Tugas Praktikum](img/tprak/tbm4.png)

**Output**

![Tugas Praktikum](img/tprak/opt2.jpeg)

![Tugas Praktikum](img/tprak/opt3.jpeg)

## Menambahkan kolom samping navigasi

![Tugas Praktikum](img/tprak/bg1.png)

![Tugas Praktikum](img/tprak/bg2.png)

**Output**

![Tugas Praktikum](img/tprak/sw1.jpeg)

```dart
 selectedIndex: selectedIndex,    // ← Change to this.
              onDestinationSelected: (value) {

                // ↓ Replace print with this.
                setState(() {
                  selectedIndex = value;
                });
```

**Output**

![Tugas Praktikum](img/tprak/sw2.jpeg)

## Menggunakan selectedIndex

```dart
Widget page;
switch (selectedIndex) {
  case 0:
    page = GeneratorPage();
    break;
  case 1:
    page = Placeholder();
    break;
  default:
    throw UnimplementedError('no widget for $selectedIndex');
}
```

**Output**

![Tugas Praktikum](img/tprak/garis1.jpeg)

**Untuk switch page**

```dart
  Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,  // ← Here.
            ),
```
