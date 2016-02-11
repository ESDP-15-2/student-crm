When(/^я создаю учебный блок с темой "([^"]*)"$/) do |theme|
  visit('/course_elements/new')
  within('#new_course_element') do
    select('ROR')
    fill_in 'course_element[theme]', with: theme
  end
  click_button('Сохранить')
end

When(/^я выбираю учебный материал и меняю его тему на "([^"]*)"$/) do |theme|
  visit('/course_elements')
  find('#course_element_1_edit').click
  within('#edit_course_element_1') do
    select('HTML')
    fill_in 'course_element[theme]', with: theme
  end
  click_button('Сохранить')
end

When(/^я удаляю учебный материал$/) do
  visit('/course_elements')
  find('#course_element_1_delete').click
  page.driver.browser.switch_to.alert.accept
end