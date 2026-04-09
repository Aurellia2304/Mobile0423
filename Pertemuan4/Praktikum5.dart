void main() {
  var mahasiswa2 = (
    'Aurellia Mezaluna',
    nim: 244107060021,
    b: true,
    'Sistem Infromasi Bisnis',
  );

  print(mahasiswa2.$1); // Prints nama
  print(mahasiswa2.nim); // Prints NIM
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints jurusan
}
