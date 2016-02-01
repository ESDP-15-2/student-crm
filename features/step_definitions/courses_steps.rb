# Courses

When(/^я создаю курс под названием "([^"]*)"$/) do |name|
  within('#new_course') do
    fill_in 'Название', with: name
  end
  click_button 'Сохранить'
end

When(/^я нахожу курс "([^"]*)" и меняю его на "([^"]*)"$/) do |old_name, new_name|
  visit('/courses')
  element = "//td//*[contains(text(), '" + old_name + "')]/ancestor::tr//*[contains(text(), 'Редактировать')]"
  find(:xpath, element).click
  within('#edit_course_2') do
    fill_in 'course[name]', with: new_name
  end
  click_button('Сохранить')
end

When(/^я удаляю курс под названием "([^"]*)"$/) do |name|
  visit('/courses')
  element = "//td//*[contains(text(), '" + name + "')]/ancestor::tr//*[contains(text(), 'Удалить')]"
  find(:xpath, element).click
  page.driver.browser.switch_to.alert.accept
end

When(/^я не вижу курс под названием "([^"]*)"$/) do |content|
  assert_not page.has_content?(content)
end