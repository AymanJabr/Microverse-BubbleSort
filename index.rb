def bubble_sort_by(string_array)
  repeat_process = false
  string_array[0..string_array.length - 2].each_with_index do |_item, index|
    comparator_value = string_array[index] <=> string_array[index + 1]
    next unless comparator_value.positive?

    value_holder = string_array[index]
    string_array[index] = string_array[index + 1]
    string_array[index + 1] = value_holder
    repeat_process = true
    # In case the value is 0 or -1, we can keep the array as is
  end

  if repeat_process
    bubble_sort_by(string_array)
  else
    string_array
  end
end

def check_validity(string_array)
  all_valid = string_array.is_a?(Array) && check_all_strings(string_array) && check_none_empty(string_array)

  raise 'Invalid data entered, please enter an non-empty array of strings' unless all_valid

  bubble_sort_by(string_array)
end

def check_none_empty(string_array)
  none_empty = true
  string_array.each do |string_word|
    none_empty = false if string_word == ''
  end
  none_empty
end

def check_all_strings(string_array)
  all_strings = true
  string_array.each do |string_word|
    all_strings = false unless string_word.is_a? String
  end
  all_strings
end

# Enter the array of strings here
puts check_validity(%w[cool perfect nice apple])
