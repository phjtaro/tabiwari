# coding: utf-8
require 'date'

#initial process
puts "どの運賃が適用できるかなんとなく計算します"
puts "1:搭乗する日から計算 2:今日から45日先(スーパー旅割)はいつか表示します"
selection = gets.chomp.to_i
today = Date.today

def disp_super_tabiwari(today)
  puts (today + 45).strftime("%Y年%m月%d日") + "から旅割がご利用いただけます。"
end

def wrong_date
  begin
  rescue => e
    puts "#{e.class}: #{e.message}"
    puts e.backtrace.join("  \n")
  end
end

#入力系メソッドたち
def input_year
  puts "搭乗する年を入力してください"
  return gets.chomp.to_i
end

def input_month
  puts "搭乗する月を入力してください"
  return gets.chomp.to_i
end

def input_day
  puts "搭乗する日を入力してください"
  return gets.chomp.to_i
end

#適用される運賃を判断するメソッド
#表示も込みになってるのはよくないかな
def decision_fee(difference_dep_day_from_today)
  if difference_dep_day_from_today > 45
    puts "スーパー旅割が適用されるかもしれません"
  elsif difference_dep_day_from_today >= 28 && difference_dep_day_from_today < 45
    puts "旅割が利用可能です"
  elsif difference_dep_day_from_today < 28
    puts "乗り継ぎ特割、特割、プレミアム特割が利用可能です"
  end
end

def calc_from_dep_day(today)
#ここで一気に入力系のメソッドを呼び出す
  dep_year  = input_year()
  dep_month = input_month() 
  dep_day   = input_day()

  unless Date.valid_date?(dep_year, dep_month, dep_day)
    wrong_date
  end

  departure = Date.new(dep_year, dep_month, dep_day)

  difference_dep_day_from_today = (departure - today)
  p difference_dep_day_from_today

#適用される運賃の判断を行う
  decision_fee(difference_dep_day_from_today)
  #decision_fee()でやりたかったが。
  #dep_monthが読み取れないので、一時外に出しておく
  if dep_month == 8|| dep_month == 12
    puts "繁忙期に入ったら普通運賃しかないかもしれません…"
  end
end

if selection == 1
  calc_from_dep_day(today)
elsif selection == 2
  disp_super_tabiwari(today)
end

