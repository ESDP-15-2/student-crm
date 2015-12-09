# Courses
ror_course = Course.create(name: 'ROR')
html_course = Course.create(name: 'HTML')

login_nikita = SmsServiceAccount.create(login: 'aisma', password: 'kiminitodoke')

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
aleksandr = Student.create!(name:'Aleksandr Gudov',
                        phone:'996707861277',
                        email: 'gudov@example.com')

students.push abai, aliia, marat, mahabat, sanjar, aleksandr


students.each do |student|
  GroupMembership.create!(student: student,
                          group: groups.sample,
                          active: true)
end
# counter = 0
#
# 6.times do
#   GroupMembership.create!(student: students[counter],
#                           group: groups.sample,
#                           active: true)
#   counter += 1
# end

