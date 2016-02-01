roles = []

roles.push Role.create!(name: 'Администратор')
roles.push Role.create!(name: 'Пользователь с полным доступом')
roles.push Role.create!(name: 'Преподаватель')
roles.push Role.create!(name: 'Студент')

admin = User.create!(name:'John',
                         surname:'Doe',
                         birthdate:'1984-06-05',
                         gender:'мужской',
                         passport_data:'IT000',
                         contact_attributes: {
                           phone:'996700700700',
                           additional_phone:'',
                           skype:'john_doe'},
                         email:'admin@gmail.com',
                         password:'password')

admin.add_role 'Администратор'

# Courses
ror_course = Course.create!(name: 'ROR', starts_at: '2016-03-16', ends_at: '2017-04-16')
html_course = Course.create!(name: 'HTML', starts_at: '2016-03-12', ends_at: '2016-12-12')

# Groups
groups = []
groups.push Group.create!(name: 'GR#1', course: ror_course)
groups.push Group.create!(name: 'GR#2', course: ror_course)
groups.push Group.create!(name: 'GR#1', course: html_course)
groups.push Group.create!(name: 'GR#2', course: html_course)