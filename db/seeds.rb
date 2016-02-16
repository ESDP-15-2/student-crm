# Users
users_path = Rails.root.join('app', 'assets', 'images', 'users')

users = []

admin = User.create!(name: 'Админ',
                     surname: 'Админов',
                     birthdate: '1983-06-05',
                     gender: 'мужской',
                     passport_data: 'IT000',
                     contact_attributes: {
                         phone: '996700000000',
                         additional_phone: '',
                         skype: 'test'},
                     email: 'admin@gmail.com',
                     password: 'password',
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

ivan.add_role 'Студент'

katya = User.create!(name: 'Катя',
                     surname: 'Цветаева',
                     birthdate: '1978-12-06',
                     gender: 'женский',
                     passport_data: 'K2-222',
                     contact_attributes: {
                         phone: '996700000002',
                         additional_phone: '',
                         skype: 'test2'},
                     email: 'test2@gmail.com',
                     password: 'password',
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
oleg = User.create!(name: 'Олег',
                    surname: 'Куликов',
                    birthdate: '1990-01-12',
                    gender: 'мужской',
                    passport_data: 'K2-333',
                    contact_attributes: {
                        phone: '996700000003',
                        additional_phone: '',
                        skype: 'test3'},
                    email: 'test3@gmail.com',
                    password: 'password',
                    photo: File.new(users_path.join('oleg.png')))

aismai.add_role 'Администратор'

victor = User.create!(name: 'Виктор',
                      surname: 'Антонов',
                      birthdate: '1990-01-30',
                      gender: 'женский',
                      passport_data: 'K2-444',
                      contact_attributes: {
                          phone: '996700000004',
                          additional_phone: '',
                          skype: 'test4'},
                      email: 'test4@gmail.com',
                      password: 'password',
                      photo: File.new(users_path.join('victor.jpg')))
victor.add_role 'Студент'

boris = User.create!(name: 'Борис',
                     surname: 'Викторов',
                     birthdate: '1990-07-18',
                     gender: 'мужской',
                     passport_data: 'K2-555',
                     contact_attributes: {
                         phone: '996700000005',
                         additional_phone: '',
                         skype: 'test5'},
                     email: 'test5@gmail.com',
                     password: 'password',
                     photo: File.new(users_path.join('boris.jpg')))

boris.add_role 'Студент'

users.push(boris, victor, aismai, katya, ivan, admin)users.push(boris, victor, oleg, katya, ivan, admin)

#сourses
courses = []
courses.push Course.create!(name: 'ROR', starts_at: Time.now, ends_at: Time.now + 1.year)
courses.push Course.create!(name: 'HTML', starts_at: Time.now, ends_at: Time.now + 1.year)

#groups
groups = []
groups.push Group.create!(name: courses.first.name + ' GR#1', course: courses.first)
groups.push Group.create!(name: courses.last.name + ' GR#1', course: courses.last)

#course_elements
array_course_elements = []
ce_counter = 0
10.times do
  ce_counter += 0

  array_course_elements.push CourseElement.create!(theme: 'Введение №' + "#{ce_counter}", course: courses.sample)
end
#group_membership

GroupMembership.create!(group: groups.first, user: users[2])
GroupMembership.create!(group: groups.first, user: users[3], active: true)
GroupMembership.create!(group: groups.first, user: users[4], active: true)
GroupMembership.create!(group: groups.first, user: users[5], active: true)
GroupMembership.create!(group: groups.first, user: users[1], active: true)

#periods
periods = []
period_counter = 0

1.times do
  datatime = Time.now
  50.times do
    datatime += 3.days
    period_counter += 1
    periods.push Period.create!(title: 'Занятие #' + "#{period_counter}", event_type: 'Лекция', commence_datetime: datatime, hw_status: true,
                                group: groups.sample, course: courses.sample, hw_deadline: datatime + 3.days,
                                course_elements_id: array_course_elements.sample.id)

  end

  datatime = Time.now
  50.times do
    datatime -= 3.days
    period_counter += 1
    periods.push Period.create!(title: 'Занятие c минусом во времени страрта #' + "#{period_counter}", event_type: 'Лекция', commence_datetime: datatime, hw_status: true,
                                group: groups.sample, course: courses.sample, hw_deadline: datatime - 3.days,
                                course_elements_id: array_course_elements.sample.id)
  end
end

