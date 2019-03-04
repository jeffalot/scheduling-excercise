puts "Testing Built-in Schedules"

#Examples


#TODO Additional Examples to Test For
# On-site Meetings - Can be back to back, no padding
# Off-site - If first meeting, padding can extend before 9AM
# Off-site - If last meeting, padding can extend past 5PM
# Off-site - If 2 off-site meetings, padding can overlap


# Example 1 - Can Fit
example_1 =    [
        { name: "Meeting 1", duration: 1.5, type: :onsite }, 
        { name: "Meeting 2", duration: 2, type: :offsite },
        { name: "Meeting 3", duration: 1, type: :onsite }, 
        { name: "Meeting 4", duration: 1, type: :offsite }, 
        { name: "Meeting 5", duration: 1, type: :offsite }
    ]
# One possible solution would be:
# 9:00 - 10:30 - Meeting 1
# 10:30 - 11:30 - Meeting 3
# 12:00 - 1:00 - Meeting 5
# 1:30 - 2:30 - Meeting 4
# 3:00 - 5:00 - Meeting 2

#Example 2 - Can't Fit
example_2 = [
    { name: "Meeting 1", duration: 4, type: :offsite },
    { name: "Meeting 2", duration: 4, type: :offsite }
    ]



#Example 3 - Can Fit
example_3 = [
        { name: "Meeting 1", duration: 0.5, type: :offsite },
        { name: "Meeting 2", duration: 0.5, type: :onsite },
        { name: "Meeting 3", duration: 2.5, type: :offsite },
        { name: "Meeting 4", duration: 3, type: :onsite }
    ]

#One possible solution would be:
# 9:00 - 9:30 - Meeting 2
# 10:00 - 10:30 - Meeting 1
# 11:00 - 2:00 - Meeting 4
# 2:30 - 5:00 - Meeting 3


#Function to test a single schedule example
def test_schedule(schedule)
  # Logical Flow of Testing a Schedule
  # Due to the 'free' 30 minutes at the beginning or end of the day for off-site meeting travel, and the ability to overlap the travel in between two off-site meetings
  # it seems that the way to fit the most meetings into a day is to start by grouping all off-site meetings together and trying to fit those onto the schedule;  Next attempt to fit the on-site meetings into the schedule as a group alongside the off-site block
  #
  # Considerations for the Solution:
  # This method relies on grouping together off-site and on-site meetings.  Given the instructions of the exercise, providing only one working solution for each set of meetings is fine,
  # but in a production environment, giving the same type of suggestions (where all off-site and on-site meetings are back-to-back) regularly might not be ideal.
  # In that case, we could opt for an algorithm that would test each combination of the meetings (this type of combinatorial algorithm could get unwieldy if provided a lot of meetings, but there are some optimizations that could help).
  # The algorithm could then provide several different options based on which orderings were valid.

  available_work_hours = 8
  proposed_work_hours = 0
  start_of_the_work_day = 9

  offsite_meetings = []
  onsite_meetings = []

  (schedule).each do |meeting|
    if(meeting[:type] == :offsite)
        offsite_meetings.push(meeting)

    else
        onsite_meetings.push(meeting)
    end
   end


  # Start by testing the offsite meetings
  offsite_meetings.each do |meeting|
    proposed_work_hours += meeting[:duration]

    #Add an additional 30 minutes of travel time that occurs after meeting conclusion
    proposed_work_hours += 0.5
  end

  # If there are no onsite meetings, we will deduct a .5 since the last meeting's post-travel can occur after working hours
  if(onsite_meetings.size == 0)
    proposed_work_hours -= 0.5
  end

  onsite_meetings.each do |meeting|
    proposed_work_hours += meeting[:duration]
  end

  if(proposed_work_hours > available_work_hours)
    puts "Schedule Won't Fit"
  else
    puts "Schedule Will Fit"
  end



  #Next print out a possible schedule with the correct times

  current_time = start_of_the_work_day
  offsite_meetings.each do |meeting|
    #TODO Fix the formatting
    puts "#{current_time % 12} - #{(meeting[:duration] + current_time) % 12} - #{meeting[:name]} - #{meeting[:type]}"
    current_time += meeting[:duration]
    current_time += 0.5
  end
  onsite_meetings.each do |meeting|
    #TODO Fix the formatting
    puts "#{current_time % 12} - #{(meeting[:duration] + current_time) % 12} - #{meeting[:name]} - #{meeting[:type]}"
    current_time += meeting[:duration]
  end




end

test_schedule(example_1)
test_schedule(example_2)
test_schedule(example_3)