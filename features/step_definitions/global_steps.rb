When(/^я вхожу в систему как администратор$/) do
  visit('/users/sign_in')
  within('#new_user') do
    fill_in 'Email', with: 'admin@gmail.com'
    fill_in 'Пароль', with: 'password'
  end
  click_button 'Войти'
end

When(/^я вижу на странице "([^"]*)"$/) do |content|
  assert page.has_content?(content)
end

When(/^я не вижу на странице "([^"]*)"$/) do |content|
  assert_not page.has_content?(content)
end