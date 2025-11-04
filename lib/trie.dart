class TrieNode {
  final Map<String, TrieNode> children = {};
  bool isEndofWord = false;
}

class Trie {
  TrieNode root = TrieNode();
  void insert(String word){
    TrieNode currentNode = root;
    for (int i = 0; i < word.length; i++) {
      final letter = word[i];
      if (!currentNode.children.containsKey(letter)){
        currentNode.children[letter] = TrieNode();
      }
      currentNode = currentNode.children[letter]!;
    }
    currentNode.isEndofWord = true;
  }
  bool search(String word){
    TrieNode currentNode = root;
    for (int i = 0; i < word.length; i++){
      final letter = word[i];
      if (!currentNode.children.containsKey(letter)){
        return false;
      }
      currentNode = currentNode.children[letter]!;
    }
    return currentNode.isEndofWord;
  }
}

void main(){
  final myTrie = Trie();
  myTrie.insert('cat');
  myTrie.insert('cab');
  myTrie.insert('car');
  myTrie.insert('cow');
  myTrie.insert('cabs');
  myTrie.insert('a'); 
  myTrie.insert('about'); 

  print(myTrie.search('cat'));
}