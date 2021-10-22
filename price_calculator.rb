#!/usr/bin/env ruby

def price_calculator
    prices = {"apple" => 0.89, "banana" => 0.99, "bread" => 2.17, "milk" => 3.97}

    puts "Please enter all the items purchased seperated by a comma"
    result = gets
    items = result.split(",")
    puts items
end

price_calculator