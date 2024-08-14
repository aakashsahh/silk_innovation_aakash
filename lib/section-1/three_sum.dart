void main() {
  List<int> nums = [-1, 0, 1, 2, -1, -4];
  List<List<int>> result = threeSum(nums);
  print(result); // Output: [[-1, 0, 1], [-1, -1, 2]]
}

List<List<int>> threeSum(List<int> nums) {
  nums.sort(); // Sort the array
  List<List<int>> result = [];

  for (int i = 0; i < nums.length - 2; i++) {
    // Skip duplicates for i
    if (i > 0 && nums[i] == nums[i - 1]) continue;

    int j = i + 1;
    int k = nums.length - 1;

    while (j < k) {
      int sum = nums[i] + nums[j] + nums[k];

      if (sum < 0) {
        j++; // Increase j to increase sum
      } else if (sum > 0) {
        k--; // Decrease k to decrease sum
      } else {
        result.add([nums[i], nums[j], nums[k]]);

        // Skip duplicates for j and k
        while (j < k && nums[j] == nums[j + 1]) j++;
        while (j < k && nums[k] == nums[k - 1]) k--;

        j++;
        k--;
      }
    }
  }

  return result;
}
