class BinaryNode {
  final int value;
  BinaryNode? leftChild;
  BinaryNode? rightChild;

  BinaryNode(this.value, {this.leftChild, this.rightChild});

  void travelPreOrder(void Function(int) action) {
    action(value);
    leftChild?.travelPreOrder(action);
    rightChild?.travelPreOrder(action);
  }

  void travelInOrder(void Function(int) action) {
    leftChild?.travelInOrder(action);
    action(value);
    rightChild?.travelInOrder(action);
  }

  void travelPostOrder(void Function(int) action) {
    leftChild?.travelPostOrder(action);
    rightChild?.travelPostOrder(action);
    action(value);
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    _buildTree(buffer, '', true, true);
    return buffer.toString();
  }

  void _buildTree(StringBuffer buffer, String prefix, bool isTail, bool isRoot) {
    buffer.write(prefix);
    if (!isRoot) {
      buffer.write(isTail ? '└── ' : '├── ');
    }
    buffer.writeln(value);

    final children = <BinaryNode?>[leftChild, rightChild]
        .where((child) => child != null)
        .toList();
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      final newPrefix = prefix + (isTail && !isRoot ? '    ' : '│   ');
      final isLastChild = i == children.length - 1;
      child?._buildTree(buffer, newPrefix, isLastChild, false);
    }
  }
}

class BinarySearchTree {
  BinaryNode? root;

  // Insert value
  void insert(int value) {
    root = _insert(root, value);
  }

  BinaryNode _insert(BinaryNode? node, int value) {
    if (node == null) {
      return BinaryNode(value);
    }
    if (value < node.value) {
      node.leftChild = _insert(node.leftChild, value);
    } else {
      node.rightChild = _insert(node.rightChild, value);
    }
    return node;
  }

  bool contains(int value) {
    BinaryNode? current = root;
    while (current != null) {
      if (value == current.value) return true;
      current = (value < current.value)
          ? current.leftChild
          : current.rightChild;
    }
    return false;
  }

  void remove(int value) {
    root = _remove(root, value);
  }

  BinaryNode? _remove(BinaryNode? node, int value) {
    if (node == null) return null;

    if (value < node.value) {
      node.leftChild = _remove(node.leftChild, value);
    } else if (value > node.value) {
      node.rightChild = _remove(node.rightChild, value);
    } else {

      if (node.leftChild == null && node.rightChild == null) {
        return null;
      }

      if (node.leftChild == null) return node.rightChild;
      if (node.rightChild == null) return node.leftChild;

      final minValue = _findMin(node.rightChild!);
      node = BinaryNode(
        minValue,
        leftChild: node.leftChild,
        rightChild: _remove(node.rightChild, minValue),
      );
    }
    return node;
  }

  int _findMin(BinaryNode node) {
    BinaryNode current = node;
    while (current.leftChild != null) {
      current = current.leftChild!;
    }
    return current.value;
  }

  @override
  String toString() {
    return root?.toString() ?? 'Empty tree';
  }
}

void main() {
  final bst = BinarySearchTree();
  bst.insert(3);
  bst.insert(1);
  bst.insert(4);
  bst.insert(0);
  bst.insert(2);
  bst.insert(5);
  print('Original tree:\n$bst');

  print('\nRemove leaf node 0:');
  bst.remove(0);
  print(bst);

  print('\nRemove node with one child (4):');
  bst.remove(4);
  print(bst);

  print('\nRemove node with two children (3):');
  bst.remove(3);
  print(bst);
}