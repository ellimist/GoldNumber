# GoldNumber

GoldNumber is a small utility that checks if a phone number can be considered Premium

## What is a Gold Number?

A gold number is a premium phone number that is more "good looking", and easier to remember.

What classifies a number as "good looking" or easy to remember?

1. "71 999999"    - Identical numbers             
2. "71 123 321"   - Palindrome => two reversed groups of numbers          
3. "71 123456"    - Consecutive numbers in ascending order       
4. "71 654321"    - Consecutive numbers in descending order
5. "71 11 22 33"  - Palindrome pairs :)          
6. "71 123 123"    - 2 identical groups
7. "71 91 91 91"    - Repetitive groups

## Installation

Add this line to your application's Gemfile:

    gem 'GoldNumber'

    
And then execute:

    $ bundle

Or install it yourself as:

    $ gem install GoldNumber

## Usage

You can require it in your application
    
    require 'goldnumber'
    
    GoldNumber::GoldNumber.new(12333333).valid? # => false
    GoldNumber::GoldNumber.new(45454545).valid? # => true


In different countries, phone numbers have a different length/format and sometimes the phone carriers have a prefix.
You can pass a second parameter in the initialization of the GoldNumber and the specified number of characters from the beginning of the number will be ignored.
    
    require 'goldnumber'
    
    GoldNumber::GoldNumber.new(12333333).valid? # => false
    GoldNumber::GoldNumber.new(12333333, 2).valid? # => true
    

## Contributing

1. Fork it ( https://github.com/ellimist/GoldNumber/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
