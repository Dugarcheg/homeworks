import 'package:hastables/bunny.dart';

void main(){
  // oneToTenIteration();
  //oneToTenRecursion();

  printBunnyName(bunnyFamily);
}

void oneToTenRecursion([int current = 1]){
  if (current > 10){
    return;
  }

  print(current);
  oneToTenRecursion(current + 1);
}

void oneToTenIteration() {
  int i = 1;
  while (i <= 10){
    print(i);
    i++;
  }
}