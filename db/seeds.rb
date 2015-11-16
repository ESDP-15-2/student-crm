# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ror_course = Course.create(name: 'ROR')

groups = []
groups.push Group.create(name: 'GR#1',
                         course: ror_course
            )
groups.push Group.create(name: 'GR#2',
                         course: ror_course
            )
students = []
40.times do
  student_name = Faker::Name.name
  students.push Student.create(name: student_name,
                               phone: Faker::PhoneNumber.cell_phone,
                               email: Faker::Internet.email(student_name),
                )
end

group_memberships = []
40.times do
  group_memberships.push GroupMembership.create(student: students.sample,
                                                group: groups.sample,
                                                active: true)
end
