When(/^я захожу по адресу "([^"]*)"$/) do |path|
  visit(path)
end

When(/^я перехожу по ссылке "([^"]*)"$/) do |link|
  click_link(link)
end

When(/^я нажимаю кнопку "([^"]*)"$/) do |button|
  click_button(button)
end

When(/^я вижу форму с полями Эл\. почта, Пароль и кнопку Войти$/) do
  page.has_xpath?("id('user_email')")
  page.has_xpath?("id('user_password')")
  page.has_xpath?("id('login_form')")
end

When(/^я ввожу в форму значения "([^"]*)" и "([^"]*)"$/) do |email, password|
  within('#new_user') do
    fill_in 'Email', with: email
    fill_in 'Пароль', with: password
  end
end

When(/^я вижу на странице "([^"]*)"$/) do |content|
  assert page.has_content?(content)
end