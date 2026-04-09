void main() {
  String nama = "Aurellia Mezaluna Azwa";
  String nim = "244107060021";

  print("Bilangan prima dari 0 sampai 201:");
  print("================================");

  for (int i = 0; i <= 201; i++) {
    if (isPrima(i)) {
      print("$i adalah bilangan prima - $nama ($nim)");
    }
  }
}

bool isPrima(int n) {
  if (n <= 1) return false;
  if (n == 2) return true;
  if (n % 2 == 0) return false;

  for (int i = 3; i <= n ~/ 2; i += 2) {
    if (n % i == 0) return false;
  }

  return true;
}
