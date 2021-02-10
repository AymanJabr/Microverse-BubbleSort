def bubble_sort_by(string_array)
  repeat_process = false
  string_array[0..string_array.length - 2].each_with_index do |_item, index|
    next unless yield(string_array[index], string_array[index + 1])

    value_holder = string_array[index]
    string_array[index] = string_array[index + 1]
    string_array[index + 1] = value_holder
    repeat_process = true

    # In case the value is 0 or -1, we can keep the array as is
  end

  if repeat_process
    bubble_sort_by(string_array) { |first_string, second_string| first_string > second_string }
  else
    string_array.join(',')
  end
end

def bubble_sort(int_array)
  repeat_process = false
  int_array[0..int_array.length - 2].each_with_index do |_item, index|
    comparator_value = int_array[index] <=> int_array[index + 1]
    next unless comparator_value.positive?

    value_holder = int_array[index]
    int_array[index] = int_array[index + 1]
    int_array[index + 1] = value_holder
    repeat_process = true
    # In case the value is 0 or -1, we can keep the array as is
  end

  if repeat_process
    bubble_sort(int_array)
  else
    int_array.join(',')
  end
end

# Enter the array of strings here
puts bubble_sort_by(%w[cool perfect nice apple]) { |first_string, second_string| first_string > second_string }
# Enter the array of integers here
puts bubble_sort([2, 3, 5, 3, 7, 0, 45])
