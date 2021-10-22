#!/usr/bin/env ruby

def print_welcome(prices)
    puts "Welcome to Emma's Market"
    puts
    puts "Here are the items for sale today"
    puts
    puts "Item\tUnit price\tSale price"
    puts "-------------------------------------"
    prices.each do |key, value|
        if key == "milk"
            puts "#{key}\t$#{value}\t\t2 for $5.00"
        elsif key == "bread"
            puts "#{key}\t$#{value}\t\t3 for $6.00"
        else
            puts "#{key}\t$#{value}"
        end
    end
    puts
end

def parse_input
    puts "Please enter all the items purchased seperated by a comma"
    result = gets
    items = result.split(",")
    return items
end

def count_items(items, groceries)
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
end

def calculate_total(groceries, itemCost, prices)
    saved = 0
    total = 0
    groceries.each do |key, value|
        if value > 0
            if key == "bread"
                n = value/3
                m = value%3
                itemCost[key] = (prices[key] * m) + (6 * n)
                saved += (prices[key] * value) - itemCost[key]
            elsif key == "milk"
                n = value/2
                m = value%2
                itemCost[key] = (prices[key] * m) + (5 * n)
                saved += (prices[key] * value) - itemCost[key]
            else
                itemCost[key] = prices[key] * value
            end
            total += itemCost[key]
        end
    end
    return total, saved
end

def price_calculator
    prices = {"apple" => 0.89, "banana" => 0.99, "bread" => 2.17, "milk" => 3.97}
    groceries = {"apple" => 0, "banana" => 0, "bread" => 0, "milk" => 0}
    itemCost = {}

    print_welcome(prices)

    items = parse_input

    count_items(items, groceries)

    result = calculate_total(groceries, itemCost, prices)

    puts
    puts "Item\tQuantity\tPrice"
    puts "-------------------------------------"
    itemCost.each do |key, value|
        puts "#{key}\t#{groceries[key]}\t\t$#{value}"
    end
    puts
    puts "Total price : $#{result[0].round(2)}"
    puts "You saved $#{result[1].round(2)} today."
    puts
end

price_calculator