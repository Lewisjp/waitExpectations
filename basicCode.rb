require 'debugger'
=begin

THE CHALLENGE
  You owe a big favor and have agreed to pick up a friend at the airport every Friday night. The airline on which your friend flies is cheap, but terrible with reporting delays and departure/arrival times. You soon realize that the 10pm flight is never on time and is usually late by more than an hour. If the plane has arrived at 11:15pm, 12:03am, 11:30pm, 11:23pm and 11:48pm, what is the average arrival time?

Does the solution still work if your friend changes to a flight arriving 6 hours later? What about 12 hours later?

Program Output

The output should look something like this when run from the console:

>> average_time_of_day(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
=> "12:01am"

>> average_time_of_day(["6:41am", "6:51am", "7:01am"])
=> "6:51am"

Hint

Your digital ways will not help you, time of day is cyclical. You may need to use the Math and Time classes.

=end

def clean_clock_display(avg_hrs,avg_mins)

  while avg_hrs >= 24
    avg_hrs -= 24
  end
  if avg_hrs >= 12
    oclock = "pm"
    avg_hrs -= 12
  else
    oclock = "am"
  end

  if avg_mins < 10
    avg_mins = "0#{avg_mins}"
  end
  if avg_hrs == 0
    avg_hrs = 12
  end


  puts "Average time of arrival #{avg_hrs}:#{avg_mins}#{oclock}"


end

def divde_by_entries(time, total_hr, total_min)
  entries = time.size
  avg_hrs = total_hr / entries 
  add_hrs = total_hr % entries * 60  #total remianing minutes from hours
  total_min += add_hrs #total remaining minutes 
  avg_mins = total_min / 3 

# puts "Step 3: Average time of arrival #{avg_hrs}:#{avg_mins}"

  step_3 = [avg_hrs,avg_mins]
end 

def sum_time(hrs, mins)
  total_hr = 0
  total_min = 0
  hrs.each do |hour|
    total_hr += hour.to_i
  end
  mins.each do |m|
    total_min += m.to_i
  end
  add_hrs = total_min.to_i / 60
  total_hr += add_hrs
  total_min -= add_hrs * 60

# puts "Total Cumulative Time #{total_hr}:#{total_min}"

  step_2 = [total_hr, total_min]
end 

def convert_clock(time)
  hrs = []
  mins = []
  if time.is_a? Array
    time.each do |pit| # Point In Time    

      am = false
      if pit.include?("am")
        am = true
      end
      if pit.include?("pm")
        am = false
      end

      pit.delete!("am")
      pit.delete!("pm") 
      pit = pit.split(":")

      if am == true 
        if pit[0] == "12"
          pit[0] = 24 # 00:00 == 24:00
        end
      else
        pit[0] = pit[0].to_i + 12
      end
    
      hrs << pit[0].to_i 
      mins << pit[1].to_i 
    end
  end
  step_1 = [hrs,mins] 
end


def average_time_of_day(time)


  if time.is_a? String  
    puts "Average of a single time is itself, #{time}"
    return nil
  end

  #Step 1: Convert the 12 hour clock to a 24 hour clock
  
  step_1 = Array.new
  if time.is_a? Array
    step_1 = convert_clock(time)
  else 
    puts "Invalid input."
    return nil
  end

    # step_1 = [hrs,mins] # => [[6, 6, 7], [41, 51, 1]]

  #Step 2: Get Sum of Times in Hours and Minutes
  step_2 = sum_time(step_1[0], step_1[1])
    # step_2 = [total_hr, total_min] # => [20, 33]

  #Step 3: Divide by entries for average time
  step_3 = divde_by_entries(time, step_2[0], step_2[1])
    #  step_3.inspect = [avg_hrs,avg_mins] #=> [6, 51]

  #Step 4: Clean up time display for 12 hour clock
  clean_clock_display(step_3[0],step_3[1])


end 


average_time_of_day(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
puts "\n\n"
average_time_of_day(["6:41am", "6:51am", "7:01am"])

average_time_of_day(["12:00am", "2:51am", "2:01am"])  # for these edge cases consider implementing more advance methods