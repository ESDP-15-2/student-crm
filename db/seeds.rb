# Courses

ror_course = Course.create(name: 'ROR')
html_course = Course.create(name: 'HTML')

# Groups

groups = []

groups.push Group.create(name: 'ROR GR#1',
                         course: ror_course)
groups.push Group.create(name: 'ROR GR#2',
                         course: ror_course)

groups.push Group.create(name: 'HTML GR#1',
                         course: html_course)
groups.push Group.create(name: 'HTML GR#2',
                         course: html_course)

# Students

=begin
students = []

40.times do
  student_name = Faker::Name.name
  students.push Student.create(name: student_name,
                               phone: Faker::PhoneNumber.cell_phone,
                               email: Faker::Internet.email(student_name))
end

# Group membership

=begin
group_memberships = []

counter = 0

40.times do
  group_memberships.push GroupMembership.create(student: students[counter],
                                                group: groups.sample,
                                                active: true)
  counter += 1
end

# Contact lists

contact_lists = []
  contact_lists.push ContactList.create(title: 'ROR GR#1')
  contact_lists.push ContactList.create(title: 'ROR GR#2')
=end

students = []

abai = Student.create!(name:'Abai Ismail',
                       phone:'996550113377',
                       email: 'aismai@example.com')

aliia = Student.create!(name:'Aliia Kaiumova',
                        phone:'996700605070',
                        email: 'tumanskaya@example.com')

marat = Student.create!(name:'Marat Kulbaev',
                        phone:'996555623310',
                        email: 'klmart@example.com')

mahabat = Student.create!(name:'Mahabat',
                          phone:'996700067042',
                          email: 'mahabbat@example.com')

sanjar = Student.create!(name:'Sanjar Musaev',
                         phone:'996550612056',
                         email: 'aismai@example.com')

gudov = Student.create!(name:'Aleksandr Gudov',
                        phone:'996707861277',
                        email: 'gudov@example.com')

students.push abai, aliia, marat, mahabat, sanjar, gudov

counter = 0

6.times do
  GroupMembership.create!(student: students[counter],
                          group: groups.sample,
                          active: true)
  counter += 1
end

