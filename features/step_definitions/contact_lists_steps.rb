When(/^я создаю список получателей с названием "([^"]*)"$/) do |title|
  visit('/contact_lists/new')
  within('#new_contact_list') do
    fill_in 'contact_list[title]', with: title
    check('Anna')
    check('Stanley')
    check('Anthony')
  end
  click_button('Сохранить')
end

When(/^я выбираю список и меняю его название на "([^"]*)"$/) do |title|
  visit('/contact_lists')
  find('#contact_list_1_edit').click
  within('#edit_contact_list_1') do
    fill_in 'contact_list[title]', with: title
    check('Joanna')
    check('Stanley')
  end
  click_button('Сохранить')
end

When(/^я удаляю список$/) do
  visit('/contact_lists')
  find('#contact_list_1_delete').click
  page.driver.browser.switch_to.alert.accept
end