require "net/http"
require "json"


#we want the user to input the time the task needs to be completed and the date
#we should be specific about how you input the date(month, day, year, time?)
#amount of time between now and the deadline

#new instance using Time.new = future time variable
#Time.now gives you the current time


# one method
# get the date & the time then we want a method that takes in those two inputs and returns the unix epoch seconds

def to_unix_time(date)
    #new time object out of the given date and time
    info = date.split("T")  #creates 2 item array
    
    the_day = info[0].split("-") #results in a 3 item array [yr, month, day]
    the_time = info[1].split(":") #results in a 3 item array [hr, min, second]
    t = Time.new(the_day[0],the_day[1],the_day[2],the_time[0],the_time[1],the_time[2])
    
    
    #convert to unix time
    return t.to_i
end

#puts to_unix_time("2011-08-19T13:45")

# another method
# takes in the unix time of the due date and compares to current time, returns the difference in hours & minutes (ideally)

def time_to_go(due_time)
    #return the amount of time in minutes that they have left to complete their task
   #puts Time.now
   current_time = Time.now.to_i - 3600*4     #converts current time at this moment to unix time in EST
                                             #(FUTURE: Work wtih any time zone!?!?)
   unix_time_remaining = due_time - current_time
   time_remaining = Time.at(unix_time_remaining)    #back into a time object
   time_remaining = time_remaining.to_s             #converts time object to a string
   #puts time_remaining
   date = time_remaining.split(" ")[0]  #grabbing date yyyy-mm-dd
  # p date
   time = time_remaining.split(" ")[1]  #grabbing time hh:mm:ss
   #p time
   hhmmss = time.split(":") #split hh mm ss into 3 elements
   #p hhmmss
   days_to_go = date.split("-")[2].to_i      #grabbing only date
  
   if days_to_go> 1 
       hhmmss[0]+= (days_to_go-1)*24
       puts "hi"
   end
   
   #assuming it's within the same year and month
   # date value = amount of days left
   # time = hh:mm:ss
   
   return hhmmss[0].to_i*60 + hhmmss[1].to_i      #should return the amount of minutes remaining
end


tomorrow = Time.new(2017, 07, 07, 2, 2, 2, "+02:00")
puts time_to_go(tomorrow.to_i)


