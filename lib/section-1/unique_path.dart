int uniquePaths(int m, int n) {
  // Create a 2D table to store the number of unique paths
  List<List<int>> dp = List.generate(m, (_) => List.filled(n, 0));

  // Initialize the first row and the first column
  for (int i = 0; i < m; i++) {
    dp[i][0] = 1;
  }
  for (int j = 0; j < n; j++) {
    dp[0][j] = 1;
  }

  // Fill the rest of the table
  for (int i = 1; i < m; i++) {
    for (int j = 1; j < n; j++) {
      dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
    }
  }

  // The number of unique paths to reach the bottom-right corner
  return dp[m - 1][n - 1];
}

void main() {
  int m = 3;
  int n = 7;
  print("Number of unique paths for a $m x $n grid: ${uniquePaths(m, n)}");
}
