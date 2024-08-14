import 'dart:collection';

// TreeNode class definition
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  
  TreeNode(this.val, {this.left, this.right});
}

// Function to perform Zigzag Level Order Traversal
List<List<int>> zigzagLevelOrder(TreeNode? root) {
  List<List<int>> result = [];
  if (root == null) return result;

  Queue<TreeNode> queue = Queue();
  queue.add(root);
  bool leftToRight = true;

  while (queue.isNotEmpty) {
    int levelSize = queue.length;
    List<int> levelNodes = [];

    for (int i = 0; i < levelSize; i++) {
      TreeNode node = queue.removeFirst();

      if (leftToRight) {
        levelNodes.add(node.val);
      } else {
        levelNodes.insert(0, node.val);  // Insert at the beginning for reverse order
      }

      if (node.left != null) queue.add(node.left!);
      if (node.right != null) queue.add(node.right!);
    }

    result.add(levelNodes);
    leftToRight = !leftToRight;
  }

  return result;
}

// Example usage
void main() {
  // Constructing the binary tree
  TreeNode root = TreeNode(3,
    left: TreeNode(9),
    right: TreeNode(20,
      left: TreeNode(15),
      right: TreeNode(7),
    ),
  );

  List<List<int>> result = zigzagLevelOrder(root);
  print(result);  // Output: [[3], [20, 9], [15, 7]]
}
