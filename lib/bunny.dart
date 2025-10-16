class Bunny {
  final String name;
  final List<Bunny> babies;

  Bunny({required this.name, required this.babies});
}

void printBunnyNamesRecursive(Bunny bunny){
  print(bunny.name);
  if (bunny.babies.isEmpty){
    return;
  }
  for (final baby in bunny.babies){
  printBunnyNamesRecursive(baby);
}
}

class Stacks<T> {
  final _list = <T>[];

  void push(T value) => _list.add(value);
  T pop() => _list.removeLast();
  bool get isEmpty => _list.isEmpty;
}

void printBunnyNamesWithStack(Bunny root) {
  final stack = Stacks<Bunny>();
  stack.push(root);

  while (!stack.isEmpty) {
    final current = stack.pop();
    print(current.name);

    for (var i = current.babies.length - 1; i >= 0; i--) {
      stack.push(current.babies[i]);
    }
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