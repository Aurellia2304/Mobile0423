void main() {
  // Langkah 1 & 2
  var gifts = {'first': 'partridge', 'second': 'turtledoves', 'fifth': 1};

  var nobleGases = {2: 'helium', 10: 'neon', 18: 2};

  print('Awal gifts: $gifts');
  print('Awal nobleGases: $nobleGases');

  // Langkah 3: Tambahan kode
  var mhs1 = Map<String, String>();
  var mhs2 = Map<int, String>();

  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  // gifts (Map<String, Object>)
  gifts['nama'] = 'Aurellia Mezaluna';
  gifts['nim'] = '244107060021';

  // nobleGases (Map<int, Object>)
  nobleGases[1] = 'Nama: Aurellia Mezaluna';
  nobleGases[3] = 'NIM: 244107060021';

  // mhs1 (Map<String, String>)
  mhs1['nama'] = 'Aurellia Mezaluna';
  mhs1['nim'] = '244107060021';

  // mhs2 (Map<int, String>)
  mhs2[1] = 'Aurellia Mezaluna';
  mhs2[2] = '244107060021';

  print('\nSetelah ditambah:');
  print('gifts: $gifts');
  print('nobleGases: $nobleGases');
  print('mhs1: $mhs1');
  print('mhs2: $mhs2');
}
