# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ror_course = Course.create(name: 'ROR')

# groups = []
# groups.push Group.create(name: 'GR#1',
#                          course: ror_course)
# groups.push Group.create(name: 'GR#2',
#                          course: ror_course)
# students = []
# 40.times do
#   student_name = Faker::Name.name
#   students.push Student.create(name: student_name,
#                                phone: Faker::PhoneNumber.cell_phone,
#                                email: Faker::Internet.email(student_name))
# end


abai = Student.create!(name:'Abai Ismail',
                       phone:'996550113377',
                       email: 'aismai@exmple.com')

aliia = Student.create!(name:'Aliia Kaiumova',
                        phone:'996700605070',
                        email: 'tumanskaya@exmple.com')

marat = Student.create!(name:'Marat Kulbaev',
                        phone:'996555623310',
                        email: 'klmart@exmple.com')

mahabat = Student.create!(name:'Mahabat',
                          phone:'996700067042',
                          email: 'mahabbat@exmple.com')

sanjar = Student.create!(name:'Sanjar Musaev',
                         phone:'996550612056',
                         email: 'aismai@exmple.com')

gudov = Student.create!(name:'Aleksandr Gudov',
                         phone:'996707861277',
                         email: 'gudov@exmple.com')

# group_memberships = []
#
# counter = 0
#
# 40.times do
#   group_memberships.push GroupMembership.create(student: students[counter],
#                                                 group: groups.sample,
#                                                 active: true)
#   counter += 1
# end

# contact_lists = []
#     contact_lists.push ContactList.create(title: 'ROR GR#1')
#     contact_lists.push ContactList.create(title: 'ROR GR#2')
