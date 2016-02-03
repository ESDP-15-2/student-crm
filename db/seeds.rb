# Courses

ror_course = Course.create!(name: 'ROR', starts_at: '2016-03-16', ends_at: '2017-04-16')
html_course = Course.create!(name: 'HTML', starts_at: '2016-03-12', ends_at: '2016-12-12')

# Groups
groups = []
groups.push Group.create!(name: 'ROR GR#1', course: ror_course)
groups.push Group.create!(name: 'ROR GR#2', course: ror_course)
groups.push Group.create!(name: 'HTML GR#1', course: html_course)
groups.push Group.create!(name: 'HTML GR#2', course: html_course)

# Course elements
8.times do
	CourseElement.create!(course_id: 1, theme: "#{Faker::App.name} #{Faker::Hacker.ingverb}",
												element_type: 'lecture')
end

8.times do
	CourseElement.create!(course_id: 2, theme: "#{Faker::App.name} #{Faker::Hacker.ingverb}",
												element_type: 'lecture')
end

# Roles
roles = []
roles.push Role.create!(name: 'Администратор')
roles.push Role.create!(name: 'Пользователь с полным доступом')
roles.push Role.create!(name: 'Преподаватель')
roles.push Role.create!(name: 'Студент')

# Users
users_path = Rails.root.join('app', 'assets', 'images', 'users')

users = []

alexander = User.create!(name:'Александр',
                         surname:'Гудов',
                         birthdate:'1983-06-05',
                         gender:'мужской',
                         passport_data:'IT000',
                         contact_attributes: {
                           phone:'996707861277',
                           additional_phone:'',
                           skype:'alexander_glok_zs'},
                         email:'admin@gmail.com',
                         password:'password',
                         photo: File.new(users_path.join('admin.jpg')))
alexander.add_role 'Администратор'

abai = User.create!(name:'Aбай',
                    surname:'Исмаил',
                    birthdate:'1990-07-13',
                    gender:'мужской',
                    passport_data:'K2-111',
                    contact_attributes: {
                      phone:'996550113377',
                      additional_phone:'',
                      skype:'aismai'},
                    email:'aismai@gmail.com',
                    password:'password',
                    photo: File.new(users_path.join('iknow.png')))

abai.add_role 'Администратор'

aliia = User.create!(name:'Алия',
                    surname:'Каюмова',
                    birthdate:'1978-12-06',
                    gender:'женский',
                    passport_data:'K2-222',
                    contact_attributes: {
                      phone:'996700605070',
                      additional_phone:'',
                      skype:'kalinka'},
                    email:'kalinka@gmail.com',
                    password:'password',
                    photo: File.new(users_path.join('aliia.jpg')))

aliia.add_role 'Студент'

marat = User.create!(name:'Марат',
                     surname:'Кульбаев',
                     birthdate:'1990-01-12',
                     gender:'мужской',
                     passport_data:'K2-333',
                     contact_attributes: {
                       phone:'996555623310',
                       additional_phone:'',
                       skype:'klmart'},
                     email:'klmart@gmail.com',
                     password:'password',
                     photo: File.new(users_path.join('marat.png')))

marat.add_role 'Студент'

mahabat = User.create!(name:'Махабат',
                     surname:'Муналбаева',
                     birthdate:'1990-01-30',
                     gender:'женский',
                     passport_data:'K2-444',
                     contact_attributes: {
                       phone:'996700067042',
                       additional_phone:'',
                       skype:'dafnaa'},
                     email:'dafnaa@gmail.com',
                     password:'password',
                     photo: File.new(users_path.join('mahabat.jpg')))
mahabat.add_role 'Студент'

sanjar = User.create!(name:'Санжар',
                     surname:'Мусаев',
                     birthdate:'1990-07-18',
                     gender:'мужской',
                     passport_data:'K2-555',
                     contact_attributes: {
                       phone:'996550612056',
                       additional_phone:'',
                       skype:'levydraiden'},
                     email:'musaev_s@gmail.com',
                     password:'password',
                     photo: File.new(users_path.join('sanjar.jpg')))

sanjar.add_role 'Студент'

users.push(abai, aliia, marat, mahabat, alexander, sanjar)

# Group Membership
student = Role.find_by(name: 'Студент')
students = student.users

students.each do |student|
  GroupMembership.create!(user: student,
                          group: groups.sample,
                          active: true)
end