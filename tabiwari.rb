# coding: utf-8
require 'date'

puts "どの運賃が適用できるかなんとなく計算します"
puts "1:搭乗する日から計算 2:今日から45日先(スーパー旅割)はいつか表示します"
selection = gets.chomp.to_i
today = Date.today

def disp_super_tabiwari(today)
  p today + 45
end

def calc_from_dep_day(today)
  puts "搭乗する年を入力してください"
  dep_year = gets.chomp.to_i

  puts "搭乗する月を入力してください"
  dep_month = gets.chomp.to_i

  puts "搭乗する日を入力してください"
  dep_day = gets.chomp.to_i

  unless Date.valid_date?(dep_year, dep_month, dep_day)
    puts "wrong date format"
    exit
  end

  departure = Date.new(dep_year, dep_month, dep_day)

  difference_dep_day_from_today = (departure - today)
  p difference_dep_day_from_today

  if difference_dep_day_from_today > 45
    puts "スーパー旅割が適用されるかもしれません"
  else
    puts "旅割になっちゃいますね"
  end
end



if selection == 1
  calc_from_dep_day(today)
elsif selection == 2
  disp_super_tabiwari(today)
end

