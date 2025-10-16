void main(){
  printByFives();
}

void printByFives([int current = 5]) {
  if (current > 100){
    return;
  }
  print(current);
  printByFives(current + 5);
}
