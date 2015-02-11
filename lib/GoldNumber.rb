require "GoldNumber/version"

module GoldNumber
    class GoldNumber

        def initialize(number, ignored_prefix=nil)

            # Receives both Integers and Strings as parameters
            if (number.is_a? Integer) || (number.is_a? String) 
                number = (number.is_a? Integer) ? number.to_s : number 
                @number = (ignored_prefix.nil?) ? number : number[ignored_prefix..-1]
            else
                raise "Wrong parameter type: number is expected to be Integer or String"
            end
        end

        # Checks if a number can be classified as a Gold Number
        # @return [Boolean]
        def valid?
            if (identical? || 
                palindrome? ||
                consecutive_ascending? ||
                consecutive_descending? ||
                two_identical_groups? ||
                palindrome_pairs? ||
                repetitive_pairs? ||
                l33t?)
                
                true    
            else
                false
            end
        end

        private

        # Checks if a number has all characters identical
        # Ex: 77777777
        def identical?
            valid = true;
            @number.split("").each_with_index do |char, i|
                if valid && (i < @number.length-1)
                    valid = (char == @number[i+1])
                end
            end
            valid
        end

        # Checks if a number is palindrome
        # Ex: 5020 0205
        #TODO: Second thoughts, maybe this isn't a Gold Number as it looks a bit ugly. Get the requirements straight :)
        def palindrome?
            @number == @number.reverse
        end

        # Checks if the number has consecutive ascending numbers
        # Ex: 12345678
        def consecutive_ascending?
            valid = true
            @number.chars.each_with_index do |char, i|
                if valid && (i < @number.length-1)
                    valid = (char.to_i+1 == @number[i+1].to_i)
                end
            end
            valid
        end

        # Checks if a number has consecutive descending numbers
        # Ex: 87654321
        def consecutive_descending?
            valid = true
            @number.chars.each_with_index do |char, i|
                if valid && (i < @number.length-1)
                    valid = (char.to_i-1 == @number[i+1].to_i)
                end
            end
            valid
        end

        # Checks if a number is made out of 2 identical groups of numbers
        # Only valid for even numbers of characters in a number
        # Ex: 12341234
        def two_identical_groups? # I'll run out of method name soon. I guarantee it.
            return false if @number.length % 2 == 1
            valid = (@number[0...@number.length/2] == @number[@number.length/2..-1])
        end

        # Checks if a number can be splitted into groups of 2, each group being a palindrome
        # Only valid for even numbers of characters in a number
        # Ex: 91112233 or 88554477
        def palindrome_pairs?
            return false if @number.length % 2 == 1

            groups, valid = [], true

            groups = @number.chars.each_slice(2).map(&:join)
            groups.each do |pair|
                if valid
                    valid = (pair == pair.reverse)
                end
            end
            valid
        end

        # Checks if a number can be splitted into groups of 2, all groups being identical
        # Only valid for even numbers of characters in a number
        # Ex: 91919191 or 80565656
        def repetitive_pairs?
            return false if @number.length % 2 == 1

            groups, valid = [], true

            groups = @number.chars.each_slice(2).map(&:join)
            groups.each_with_index do |pair, i|
                if valid && (i < groups.length-1)
                    valid = (pair == groups[i+1])
                end
            end
            valid
        end

        # Checks if you have a 1337 number
        # Ex: 13371337
        def l33t?
            return true if @number.include? "1337"
        end
    end
end