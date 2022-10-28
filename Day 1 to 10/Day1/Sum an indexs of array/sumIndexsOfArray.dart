import 'dart:ffi';

void main() {
  const numbers = [1,3,5,7,9];
  var total = 0;
  // for (var num in numbers){
  // total += num;
  // }
  for (int i =0; i<numbers.length; i++)
  {
    total = total + numbers[i];
  }
  print(total);
}