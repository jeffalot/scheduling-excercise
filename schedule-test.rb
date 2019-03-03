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
