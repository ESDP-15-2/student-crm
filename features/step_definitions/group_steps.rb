When(/^я создаю группу с названием "([^"]*)"$/) do |name|
  visit('/groups/new')
  within('#new_group') do
    fill_in 'group[name]', with: name
    select('ROR')
    check('Stanley')
    check('Anna')
  end
  click_button 'Сохранить'
end

When(/^я выбираю группу и меняю её название на "([^"]*)"$/) do |new_name|
  visit('/groups')
  find('#group_1_edit').click
  within('#edit_group_1') do
    fill_in 'group[name]', with: new_name
    check('Joanna')
    check('Anthony')
  end
  click_button 'Сохранить'
end

When(/^я удаляю группу$/) do
  visit('/groups')
  find('#group_1_delete').click
  page.driver.browser.switch_to.alert.accept
end