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