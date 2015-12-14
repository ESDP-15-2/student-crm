# Courses
ror_course = Course.create!(name: 'ROR')
html_course = Course.create!(name: 'HTML')

# Groups
groups = []
groups.push Group.create!(name: 'ROR GR#1',
                         course: ror_course)
groups.push Group.create!(name: 'ROR GR#2',
                         course: ror_course)
groups.push Group.create!(name: 'HTML GR#1',
                         course: html_course)
groups.push Group.create!(name: 'HTML GR#2',
                         course: html_course)
# Users
users = []

alexander = User.create!(name:'Alexander',
                         surname:'Gudov',
                         birthdate:'1983-06-05',
                         gender:'male',
                         passport_data:'IT000',
                         contact_attributes: {
                           phone:'996707861277',
                           additional_phone:'',
                           skype:'alexander_glok_zs'},
                         email:'admin@gmail.com',
                         password:'password')
alexander.add_role 'admin'

abai = User.create!(name:'Abai',
                    surname:'Ismail',
                    birthdate:'1990-07-13',
                    gender:'male',
                    passport_data:'K2-111',
                    contact_attributes: {
                      phone:'996550113377',
                      additional_phone:'',
                      skype:'aismai'},
                    email:'aismai@gmail.com',
                    password:'password')
abai.add_role 'student'

aliia = User.create!(name:'Aliia',
                    surname:'Kaiumova',
                    birthdate:'1978-12-06',
                    gender:'female',
                    passport_data:'K2-222',
                    contact_attributes: {
                      phone:'996700605070',
                      additional_phone:'',
                      skype:'kalinka'},
                    email:'kalinka@gmail.com',
                    password:'password')
aliia.add_role 'student'

marat = User.create!(name:'Marat',
                     surname:'Kulbaev',
                     birthdate:'1990-01-12',
                     gender:'male',
                     passport_data:'K2-333',
                     contact_attributes: {
                       phone:'996555623310',
                       additional_phone:'',
                       skype:'klmart'},
                     email:'klmart@gmail.com',
                     password:'password')
marat.add_role 'student'

mahabat = User.create!(name:'Mahabat',
                     surname:'Munalbaeva',
                     birthdate:'1990-01-11',
                     gender:'female',
                     passport_data:'K2-444',
                     contact_attributes: {
                       phone:'996700067042',
                       additional_phone:'',
                       skype:'dafnaa'},
                     email:'dafnaa@gmail.com',
                     password:'password')
mahabat.add_role 'student'

sanjar = User.create!(name:'Sanjar',
                     surname:'Musaev',
                     birthdate:'1990-07-18',
                     gender:'male',
                     passport_data:'K2-555',
                     contact_attributes: {
                       phone:'996550612056',
                       additional_phone:'',
                       skype:'levydraiden'},
                     email:'musaev_s@gmail.com',
                    password:'password')
sanjar.add_role 'student'

users.push abai, aliia, marat, mahabat, alexander, sanjar

# Group Membership
student = Role.find_by(name: 'student')
students = student.users

students.each do |student|
  GroupMembership.create!(user: student,
                          group: groups.sample,
                          active: true)
end

# Sms Service Accounts
login_nikita = SmsServiceAccount.create!(login: 'aisma', password: 'kiminitodoke')