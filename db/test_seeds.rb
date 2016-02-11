# Roles
roles = []

roles.push Role.create!(name: 'Администратор')
roles.push Role.create!(name: 'Пользователь с полным доступом')
roles.push Role.create!(name: 'Преподаватель')
roles.push Role.create!(name: 'Студент')

# Users
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

anna = User.create!(name:'Anna',
                     surname:'Morgan',
                     birthdate:'1988-12-06',
                     gender:'женский',
                     passport_data:'K2-222',
                     contact_attributes: {
                         phone:'996700605070',
                         additional_phone:'',
                         skype:'annamorgan'},
                     email:'amorgan@gmail.com',
                     password:'password')

anna.add_role 'Студент'

stan = User.create!(name:'Stanley',
                     surname:'McDonald',
                     birthdate:'1990-01-12',
                     gender:'мужской',
                     passport_data:'K2-333',
                     contact_attributes: {
                         phone:'996555623310',
                         additional_phone:'',
                         skype:'stanmd'},
                     email:'stanmd@gmail.com',
                     password:'password')

stan.add_role 'Студент'

joanna = User.create!(name:'Joanna',
                       surname:'Temple',
                       birthdate:'1990-01-30',
                       gender:'женский',
                       passport_data:'K2-444',
                       contact_attributes: {
                           phone:'996700067042',
                           additional_phone:'',
                           skype:'joannatemple'},
                       email:'jtemple@gmail.com',
                       password:'password')

joanna.add_role 'Студент'

tony = User.create!(name:'Anthony',
                      surname:'Steer',
                      birthdate:'1990-07-18',
                      gender:'мужской',
                      passport_data:'K2-555',
                      contact_attributes: {
                          phone:'996550550550',
                          additional_phone:'',
                          skype:'tonysteer'},
                      email:'steert@gmail.com',
                      password:'password')

tony.add_role 'Студент'

# Courses
ror_course = Course.create!(name: 'ROR', starts_at: '2016-03-16', ends_at: '2017-04-16')
html_course = Course.create!(name: 'HTML', starts_at: '2016-03-12', ends_at: '2016-12-12')

# Course Elements
intro = CourseElement.create!(course: ror_course, theme: 'Intro')

# Groups
groups = []
groups.push Group.create!(name: 'Group 1', course: ror_course)
groups.push Group.create!(name: 'Group 2', course: ror_course)
groups.push Group.create!(name: 'Group 3', course: html_course)

# SMS Service Account
jane_account = SmsServiceAccount.create!(login: 'jane_doe', password: 'password')
jane = Sender.create!(name: 'Jane', sms_service_account: jane_account)

# Contact List
contact_list = ContactList.create!(title: 'Contact list', user_ids: [admin.id,
                                                                     stan.id,
                                                                     joanna.id,
                                                                     anna.id])
# SMS Delivery
sms_delivery = SmsDelivery.create!(content: 'Some content',
                                   sender_id: jane.id,
                                   contact_list_id: contact_list.id,
                                   title: 'Delivery')