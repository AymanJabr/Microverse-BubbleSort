


def bubble_sort_by(string_array)

    repeat_process = false
    
    string_array[0..string_array.length() - 2].each_with_index do |item, index|
        comparator_value = string_array[index] <=> string_array[index + 1]

        if (comparator_value > 0)
            value_holder = string_array[index]
            string_array[index] = string_array[index + 1]
            string_array[index + 1] = value_holder
            repeat_process = true
        #In case the value is 0 or -1, we can keep the array as is
        end
    end

    if(repeat_process) 
        bubble_sort_by(string_array)
    else
        return string_array
    end

end

def check_validity(string_array)
    all_valid = true
    all_valid = (string_array.kind_of?(Array)) && check_all_strings(string_array) && check_none_empty(string_array) 
    if(all_valid)
       return bubble_sort_by(string_array)
    else
        return raise "Invalid data entered, please enter an non-empty array of strings"
    end
end

def check_none_empty(string_array)
    none_empty = true
    string_array.each { |string_word| 
        if( string_word == "") 
            none_empty = false
        end
    }
    return none_empty
end

def check_all_strings(string_array)
    all_strings = true
    string_array.each { |string_word| 
        if (! string_word.kind_of? String) 
            all_strings = false
        end
    }
    return all_strings
end


# Enter the array of strings here
puts check_validity(["cool","perfect","nice","apple"])