class Bunny {
  final String name;
  final List<Bunny> babies;

  Bunny({required this.name, required this.babies});
}

void printBunnyName(Bunny bunny){
  print(bunny.name);
  if (bunny.babies.isEmpty){
    return;
  }
  for (final baby in bunny.babies){
  printBunnyName(baby);
}
}

final bunnyFamily = Bunny(name: 'Mommy', babies: [
  Bunny(name: 'Happy', babies: [
    Bunny(name: 'Larry', babies: []),
    Bunny(name: 'Barry', babies: []),
  ]),
  Bunny(name: 'Tappy', babies: [
    Bunny(name: 'Walt', babies: []),
    Bunny(name: 'Salt', babies: []),
    Bunny(name: 'Malt', babies: []),
  ]),
  Bunny(name: 'Mappy', babies: [
    Bunny(name: 'Bob', babies: []),
  ]),
]);