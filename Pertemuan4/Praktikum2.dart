void main() {
  // Langkah 2: Set halogens
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print('Halogens: $halogens');

  // Langkah 3: Tiga variabel
  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.
  var names3 = {}; // Creates a map, not a set.

  print('names1 awal: $names1');
  print('names2 awal: $names2');
  print('names3 (Map): $names3');

  names1.add('Nama: Aurellia Mezaluna');
  names1.add('NIM: 244107060021');

  // Menggunakan .addAll() untuk menambah sekaligus
  names2.addAll({'Nama: Aurellia Mezaluna', 'NIM: 244107060021'});

  print('\nSetelah ditambah elemen:');
  print('names1: $names1');
  print('names2: $names2');
}
