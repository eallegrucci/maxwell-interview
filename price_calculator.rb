#!/usr/bin/env ruby

def price_calculator
    prices = {"apple" => 0.89, "banana" => 0.99, "bread" => 2.17, "milk" => 3.97}
    groceries = {"apple" => 0, "banana" => 0, "bread" => 0, "milk" => 0}

    puts "Please enter all the items purchased seperated by a comma"
    result = gets
    items = result.split(",")

    items.each do |item|
        if item.include? "apple"
            groceries["apple"] += 1
        elsif item.include? "banana"
            groceries["banana"] += 1
        elsif item.include? "bread"
            groceries["bread"] += 1
        elsif item.include? "milk"
            groceries["milk"] += 1
        end
    end

    puts groceries
end

price_calculator