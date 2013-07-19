#--- TimeSlots
m1 = TimeSlot.create(start_time: '9:00', end_time: '12:00', day: 'Monday', slotcode: 'M1')
m2 = TimeSlot.create(start_time: '13:00', end_time: '17:00', day: 'Monday', slotcode: 'M2')
m3 = TimeSlot.create(start_time: '19:00', end_time: '20:30', day: 'Monday', slotcode: 'M3')

tu1 = TimeSlot.create(start_time: '9:00', end_time: '12:00', day: 'Tuesday', slotcode: 'Tu1')
tu2 = TimeSlot.create(start_time: '13:00', end_time: '17:00', day: 'Tuesday', slotcode: 'Tu2')
tu3 = TimeSlot.create(start_time: '19:00', end_time: '20:30', day: 'Tuesday', slotcode: 'Tu3')

w1 = TimeSlot.create(start_time: '9:00', end_time: '12:00', day: 'Wednesday', slotcode: 'W1')
w2 = TimeSlot.create(start_time: '13:00', end_time: '17:00', day: 'Wednesday', slotcode: 'W2')
w3 = TimeSlot.create(start_time: '19:00', end_time: '20:30', day: 'Wednesday', slotcode: 'W3')

th1 = TimeSlot.create(start_time: '9:00', end_time: '12:00', day: 'Thursday', slotcode: 'Th1')
th2 = TimeSlot.create(start_time: '13:00', end_time: '17:00', day: 'Thursday', slotcode: 'Th2')
th3 = TimeSlot.create(start_time: '19:00', end_time: '20:30', day: 'Thursday', slotcode: 'Th3')

f1 = TimeSlot.create(start_time: '9:00', end_time: '12:00', day: 'Friday', slotcode: 'F1')
f2 = TimeSlot.create(start_time: '13:00', end_time: '17:00', day: 'Friday', slotcode: 'F2')
f3 = TimeSlot.create(start_time: '19:00', end_time: '20:30', day: 'Friday', slotcode: 'F3')

#--------- Rooms
room1 = Room.create(name: "Room 1", capacity: 50)
room2 = Room.create(name: "Room 2", capacity: 30)

#------ Users
pavling = User.create(name: "Michael Pavling", dob: "1975-01-01", address: "1 Main Street, London, UK", bio: "Blarby blarb", user_image: "", username: "mpavling", balance: 0, role: "teacher",  email: "pavling@meow.com", password:'pavling', password_confirmation:'pavling')
willock = User.create(name: "James Willock", dob: '1989-08-08', address: "1 Sunshine & Ponies Lane, Gumdrops, Candyland", bio: "I DESIGN & SO CAN YOU!", user_image: "", username: "niceguyjames", balance: 0, role: "teacher", email: "niceguyjames@css4lyf.com", password:'willock', password_confirmation:'willock')
mathe = User.create(name: "Geraud Mathe", dob: '1975-06-06', address: "1 Frenchie Road, Paris, France", bio: "croissants, baguettes, and wine", user_image: "", username: "frenchie", balance: 0, role: "teacher",  email: "mathe@wdi.com", password:'mathe', password_confirmation:'mathe')

User.create([ 
   {name: "Gordon Macrae", dob: '1975-05-05', address: "1 Raspberry Road, London, UK", bio: "meow meow meow", user_image: "", username: "gmacrae", balance: 0, role: "admin", email: "macrae@wdi.com", password:'maccrae', password_confirmation:'maccrae'},
   {name: "Charles Ponti", dob: "1986-04-04", address: "18 High Street, London, UK", bio: "lalalalalalala", user_image: "", username: "cjponti", balance: 0, role: "student",  email: "meowington@meow.com", password:'ponti', password_confirmation:'ponti' },
   {name: "Andrea Kennedy", dob: "1990-09-09", address: "1 Jersey Lane, London, UK", bio: "Oh, Canada", user_image: "", username: "kennedy", balance: 0, role: "student",  email: "akennedy@meow.com", password:'kennedy', password_confirmation:'kennedy'}
])

#----- Courses
wdi = Course.create(name: "Web Development Immersive", description: "Yr brunch Vice occupy Banksy, post-ironic small bat...", price: 7000.00, teacher_id: pavling.id, course_image: "", seats: room2.capacity)
ds = Course.create(name: "Data Science", description: "Data + Science", price: 4000.00, teacher_id: mathe.id, course_image: "", seats: room1.capacity)
fewd = Course.create(name: "Front-End Web Development", description: "html + css", price:3000.00, teacher_id: willock.id, course_image: "", seats: room2.capacity)

#---- Schedules
Schedule.create([ 
  {room_id: room2.id, course_id: wdi.id, start_date: "2013-06-15", end_date: "2013-09-15", time_slot_id: m1.id},
  {room_id: room2.id, course_id: wdi.id, start_date: "2013-06-15", end_date: "2013-09-15", time_slot_id: m2.id},
  {room_id: room2.id, course_id: wdi.id, start_date: "2013-06-15", end_date: "2013-09-15", time_slot_id: tu1.id},
  {room_id: room2.id, course_id: wdi.id, start_date: "2013-06-15", end_date: "2013-09-15", time_slot_id: tu2.id},
  {room_id: room2.id, course_id: wdi.id, start_date: "2013-06-15", end_date: "2013-09-15", time_slot_id: w1.id},
  {room_id: room2.id, course_id: wdi.id, start_date: "2013-06-15", end_date: "2013-09-15", time_slot_id: w2.id},
  {room_id: room2.id, course_id: wdi.id, start_date: "2013-06-15", end_date: "2013-09-15", time_slot_id: th1.id},
  {room_id: room2.id, course_id: wdi.id, start_date: "2013-06-15", end_date: "2013-09-15", time_slot_id: th2.id},
  {room_id: room2.id, course_id: wdi.id, start_date: "2013-06-15", end_date: "2013-09-15", time_slot_id: f1.id},
  {room_id: room2.id, course_id: wdi.id, start_date: "2013-06-15", end_date: "2013-09-15", time_slot_id: f2.id},
  {room_id: room1.id, course_id: ds.id, start_date: "2013-08-22", end_date: "2013-11-07", time_slot_id: tu3.id},
  {room_id: room1.id, course_id: ds.id, start_date: "2013-08-22", end_date: "2013-11-07", time_slot_id: th3.id},
  {room_id: room2.id, course_id: fewd.id, start_date: "2013-07-17", end_date: "2013-09-25", time_slot_id: m2.id}
])
