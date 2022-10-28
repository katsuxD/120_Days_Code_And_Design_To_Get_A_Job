import 'dart:io';
import 'dart:math';

enum chon {
  bua,
  keo,
  bao,
}
void main() {
  final rng = Random();
  while (true) {
    stdout.write(
        "Hãy lựa chọn (bua, keo, bao), để thoát game nhấn 'quit'. Lựa chọn của bạn là : ");
    final input = stdin.readLineSync();
    if (input == 'bua' || input == 'keo' || input == 'bao') {
      var playerChon;
      if (input == 'bua') {
        playerChon = chon.bua;
      }
      if (input == 'bao') {
        playerChon = chon.bao;
      }
      if (input == 'keo') {
        playerChon = chon.keo;
      }
      final random = rng.nextInt(3);
      final machineOption = chon.values[random];
      print('Bạn chọn: $playerChon');
      print('Máy chọn: $machineOption');
      if (playerChon == chon.bua && machineOption == chon.keo ||
          playerChon == chon.keo && machineOption == chon.bao ||
          playerChon == chon.bao && machineOption == chon.bua) {
        print('Bạn thắng rồi! \n');
      } else if (playerChon == machineOption) {
        print('Hòa nha, hên đấy! \n');
      } else {
        print('Bạn thua rồi! \n');
      }
    } else if (input == 'quit') {
      break;
    } else {
      print('Vui lòng chọn các lựa chọn được nêu!');
    }
  }
}
