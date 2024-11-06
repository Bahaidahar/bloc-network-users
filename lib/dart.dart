void main() {
  const List<int> numbers = [1, 2, 3, 4, 5];

  var doubledNumbers = numbers.map((number) => number * number);

  // Convert the iterable to a list (optional)
  print(doubledNumbers.toList());
  print(numbers);
}
