# function for deminal to binary

def dec_to_bin(input)
    digits = []
    number = input
    while number >= 2
        digits.unshift(number % 2)
        number = number / 2
    end
    digits.unshift(1)
    digits.each do |digit|
        print digit
    end
    puts
end

# function for binary to decimal

def bin_to_dec(input)
    number = input.to_s.reverse
    counter = 0
    sum = 0
    until counter == input.to_s.length
        sum += number[counter].to_i * (2**counter)
        counter += 1
    end

    p sum
end

# function for hexadecimal to binary

def hex_to_bin(input)
    digits = []
    hexcode = {"A" => 10, "B" => 11, "C" => 12, "D" => 13, "E" => 14, "F" => 15}
    number = input.to_s.reverse
    counter = 0
    decimal_sum = 0
    until counter == input.to_s.length
        digit = number[counter]
        if hexcode.has_key?(digit)
            digit = hexcode[digit]
        end
        decimal_sum += digit.to_i * (16**counter)
        counter += 1
    end
    return dec_to_bin(decimal_sum)
end

# function for binary to hexadecimal
