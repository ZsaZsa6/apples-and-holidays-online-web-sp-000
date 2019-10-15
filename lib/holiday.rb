require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
    holiday_hash[:winter].each {|holiday, supplies| supplies << supply}
  end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring].each {|holiday, supplies| supplies << supply}
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
    holiday_hash[season][holiday_name] = supply_array

end

def all_winter_holiday_supplies(holiday_hash)
       holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
holiday_hash.each do |season, holiday|
  puts "#{season.capitalize}:"
  holiday.each do |holiday_name, supplies|
    puts "  #{holiday_name.to_s.split("_").collect {|split_name| split_name.capitalize}.join(" ")}:
     #{supplies.join(", ")}"

    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  holiday_hash.map do |season, holidays|
    holidays.map do |holiday_name, supplies|
      supplies.include?("BBQ") ? holiday_name : nil
          # binding.pry
    end
  end.flatten.compact
end
