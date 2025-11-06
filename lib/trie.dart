import 'dart:math';

class TrieNode {
  final Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  TrieNode root = TrieNode();

  void insert(String word) {
    TrieNode currentNode = root;
    for (int i = 0; i < word.length; i++) {
      final letter = word[i];
      if (!currentNode.children.containsKey(letter)) {
        currentNode.children[letter] = TrieNode();
      }
      currentNode = currentNode.children[letter]!;
    }
    currentNode.isEndOfWord = true;
  }

  bool search(String word) {
    TrieNode currentNode = root;
    for (int i = 0; i < word.length; i++) {
      final letter = word[i];
      if (!currentNode.children.containsKey(letter)) {
        return false;
      }
      currentNode = currentNode.children[letter]!;
    }
    return currentNode.isEndOfWord;
  }

  bool isPrefix(String prefix) {
    TrieNode currentNode = root;
    for (int i = 0; i < prefix.length; i++) {
      final letter = prefix[i];
      if (!currentNode.children.containsKey(letter)) {
        return false;
      }
      currentNode = currentNode.children[letter]!;
    }
    return true;
  }
}


void loadSampleWords(Trie trie) {
  final baseWords = [
    'мама', 'папа', 'мир', 'гора', 'река', 'ветер', 'снег', 'весна', 'лето',
    'осень', 'зима', 'лист', 'дом', 'окно', 'работа', 'друг', 'вода', 'небо',
    'путь', 'свет', 'ночь', 'огонь', 'трава', 'сад', 'цветок', 'солнце',
    'луна', 'звезда', 'лес', 'птица', 'рыба', 'животное', 'кошка', 'собака',
    'вера', 'мечта', 'любовь', 'вопрос', 'ответ', 'письмо', 'язык', 'книга',
    'ум', 'радость', 'страх', 'жизнь', 'день', 'год', 'время', 'человек',
    'ребенок', 'школа', 'учитель', 'врач', 'город', 'улица', 'дорога', 'парк',
    'магазин', 'еда', 'завтрак', 'обед', 'ужин', 'сахар', 'хлеб', 'соль',
    'вилка', 'ложка', 'чашка', 'тарелка', 'окно', 'дверь', 'стол', 'стул',
    'комната', 'квартира', 'машина', 'поезд', 'самолет', 'вокзал', 'аэропорт',
    'вода', 'океан', 'море', 'волна', 'берег', 'гора', 'поле', 'луг', 'земля',
    'ветка', 'яблоко', 'груша', 'вишня', 'ягода', 'гриб', 'туман', 'снегопад',
    'зеркало', 'рука', 'нога', 'глаз', 'нос', 'рот', 'голова', 'волос', 'сердце'
  ];

  
  for (int i = 0; i < 15; i++) {
    for (var word in baseWords) {
      trie.insert('$word$i');
    }
  }
}


List<List<String>> generateGrid(int size) {
  const letters = 'абвгдеёжзийклмнопрстуфхцчшщыэюя';
  final random = Random();
  return List.generate(size, (_) {
    return List.generate(size, (_) {
      return letters[random.nextInt(letters.length)];
    });
  });
}

void printGrid(List<List<String>> grid) {
  for (var row in grid) {
    print(row.join(' '));
  }
}


Set<String> findWords(List<List<String>> grid, Trie trie) {
  final rows = grid.length;
  final cols = grid[0].length;
  final found = <String>{};
  final visited = List.generate(rows, (_) => List.generate(cols, (_) => false));

  void dfs(int r, int c, String word) {
    if (r < 0 || c < 0 || r >= rows || c >= cols || visited[r][c]) return;

    final newWord = word + grid[r][c];
    if (!trie.isPrefix(newWord)) return;

    if (trie.search(newWord) && newWord.length > 2) {
      found.add(newWord);
    }

    visited[r][c] = true;

    for (int dr = -1; dr <= 1; dr++) {
      for (int dc = -1; dc <= 1; dc++) {
        if (dr != 0 || dc != 0) {
          dfs(r + dr, c + dc, newWord);
        }
      }
    }

    visited[r][c] = false;
  }

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      dfs(i, j, '');
    }
  }

  return found;
}

void main() {
  final trie = Trie();
  loadSampleWords(trie);

  final grid = generateGrid(6);
  print('Generated 6x6 grid:\n');
  printGrid(grid);

  final wordsFound = findWords(grid, trie);

  print('\nFound ${wordsFound.length} words:\n');
  print(wordsFound);
}