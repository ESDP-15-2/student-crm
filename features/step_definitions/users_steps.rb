When(/^я ввожу данные пользователя:$/) do |table|
  within('#new_user') do
    fill_in 'Имя', with: table.hashes[0][:name]
    fill_in 'Фамилия', with: table.hashes[0][:surname]
    fill_in 'Паспорт', with: table.hashes[0][:passport_data]
    fill_in 'Номер телефона', with: table.hashes[0][:phone]
    fill_in 'Skype', with: table.hashes[0][:skype]
    fill_in 'Email', with: table.hashes[0][:email]
    check('Студент')
  end
  click_button 'Сохранить'
end

When(/^я вижу пользователя с ранее введенными данными$/) do
  assert page.has_content?('John')
  assert page.has_content?('Doe')
  assert page.has_content?('AN007')
  assert page.has_content?('996777777777')
  assert page.has_content?('jdoe')
  assert page.has_content?('jdoe@gmail.com')
end

When(/^я выбираю пользователя и меняю его имя на "([^"]*)"$/) do |name|
  visit('/users')
  find('#user_1_edit').click
  within('#edit_user_1') do
    fill_in 'Имя', with: name
    check('Администратор')
  end
  click_button('Сохранить')
end

When(/^я удаляю пользователя$/) do
  visit('/users')
  find('#user_1_delete').click
  page.driver.browser.switch_to.alert.accept
end