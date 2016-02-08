# Courses

When(/^я создаю курс под названием "([^"]*)"$/) do |name|
  visit('/courses/new')
  within('#new_course') do
    fill_in 'Название', with: name
  end
  click_button 'Сохранить'
end

When(/^я выбираю курс и меняю его название на "([^"]*)"$/) do |name|
  visit('/courses')
  find('#course_2_edit').click
  within('#edit_course_2') do
    fill_in 'course[name]', with: name
  end
  click_button('Сохранить')
end

When(/^я удаляю курс$/) do
  visit('/courses')
  find('#course_1_delete').click
  page.driver.browser.switch_to.alert.accept
end