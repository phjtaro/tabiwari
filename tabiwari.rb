# coding: utf-8
require 'date'

puts "どの運賃が適用できるかなんとなく計算します"
puts "1:搭乗する日から計算 2:今日から45日先(スーパー旅割)はいつか表示します"
selection = gets.chomp.to_i
today = Date.today

def disp_super_tabiwari(today)
  puts (today + 45).strftime("%Y年%m月%d日") + "から旅割がご利用いただけます。"
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
  elsif difference_dep_day_from_today >= 28 && difference_dep_day_from_today < 45
    puts "旅割が利用可能です"
  elsif difference_dep_day_from_today < 28
    puts "乗り継ぎ特割、特割、プレミアム特割が利用可能です"
  end
end



if selection == 1
  calc_from_dep_day(today)
elsif selection == 2
  disp_super_tabiwari(today)
end

