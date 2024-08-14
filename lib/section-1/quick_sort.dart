// Quick Sort function
void quickSort(List<int> arr, int low, int high) {
  if (low < high) {
    int pivotIndex = partition(arr, low, high);

    // Recursively apply the same logic to the left and right subarrays
    quickSort(arr, low, pivotIndex - 1);
    quickSort(arr, pivotIndex + 1, high);
  }
}

// Partition function to place the pivot element in its correct position
int partition(List<int> arr, int low, int high) {
  int pivot = arr[high];
  int i = low - 1; // Index of the smaller element

  for (int j = low; j < high; j++) {
    if (arr[j] <= pivot) {
      i++;
      // Swap arr[i] and arr[j]
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }

  // Swap arr[i+1] and arr[high] (or pivot)
  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;

  return i + 1;
}

// Example usage
void main() {
  List<int> arr = [10, 7, 8, 9, 1, 5];
  int n = arr.length;

  print("Unsorted array: $arr");

  quickSort(arr, 0, n - 1);

  print("Sorted array: $arr");
}
