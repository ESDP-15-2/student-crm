# Users
users_path = Rails.root.join('app', 'assets', 'images', 'users')

users = []

admin = User.create!(name:'Админ',
                         surname:'Админов',
                         birthdate:'1983-06-05',
                         gender:'мужской',
                         passport_data:'IT000',
                         contact_attributes: {
                             phone:'996700000000',
                             additional_phone:'',
                             skype:'test'},
                         email:'admin@gmail.com',
                         password:'password',
                         photo: File.new(users_path.join('admin.jpg')))
admin.add_role 'Администратор'

ivan = User.create!(name:'Иван',
                    surname:'Иванов',
                    birthdate:'1990-07-13',
                    gender:'мужской',
                    passport_data:'K2-111',
                    contact_attributes: {
                        phone:'996700000001',
                        additional_phone:'',
                        skype:'test1'},
                    email:'test1@gmail.com',
                    password:'password',
                    photo: File.new(users_path.join('ivan.png')))

ivan.add_role 'Администратор'

katya = User.create!(name:'Катя',
                     surname:'Цветаева',
                     birthdate:'1978-12-06',
                     gender:'женский',
                     passport_data:'K2-222',
                     contact_attributes: {
                         phone:'996700000002',
                         additional_phone:'',
                         skype:'test2'},
                     email:'test2@gmail.com',
                     password:'password',
                     photo: File.new(users_path.join('katya.jpg')))

katya.add_role 'Студент'

aismai = User.create!(name:'aismai',
                     surname:'iamsia',
                     birthdate:'1990-01-12',
                     gender:'мужской',
                     passport_data:'K2-333',
                     contact_attributes: {
                         phone:'996550113377',
                         additional_phone:'',
                         skype:'aismai'},
                     email:'aismai@gmail.com',
                     password:'password',
                     photo: File.new(users_path.join('aismai.png')))

aismai.add_role 'Администратор'

victor = User.create!(name:'Виктор',
                       surname:'Антонов',
                       birthdate:'1990-01-30',
                       gender:'женский',
                       passport_data:'K2-444',
                       contact_attributes: {
                           phone:'996700000004',
                           additional_phone:'',
                           skype:'test4'},
                       email:'test4@gmail.com',
                       password:'password',
                       photo: File.new(users_path.join('victor.jpg')))
victor.add_role 'Студент'

boris = User.create!(name:'Борис',
                      surname:'Викторов',
                      birthdate:'1990-07-18',
                      gender:'мужской',
                      passport_data:'K2-555',
                      contact_attributes: {
                          phone:'996700000005',
                          additional_phone:'',
                          skype:'test5'},
                      email:'test5@gmail.com',
                      password:'password',
                      photo: File.new(users_path.join('boris.jpg')))

boris.add_role 'Студент'

users.push(boris, victor, aismai, katya, ivan, admin)