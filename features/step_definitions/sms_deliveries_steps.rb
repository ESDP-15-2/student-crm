When(/^я создаю рассылку с данными:$/) do |table|
  visit('/sms_deliveries/new')
  within('#new_sms_delivery') do
    fill_in 'sms_delivery[content]', with: table.hashes[0][:content]
    fill_in 'sms_delivery[title]', with: table.hashes[0][:title]
    select('Jane', from: 'sms_delivery[sender_id]')
    select('Contact list', from: 'sms_delivery[contact_list_id]')
  end
  click_button('Сохранить')
end

When(/^я выбираю рассылку и меняю его название на "([^"]*)"$/) do |title|
  visit('/sms_deliveries')
  find('#sms_delivery_1_edit').click
  within('#edit_sms_delivery_1') do
    fill_in 'sms_delivery[title]', with: title
  end
  click_button('Сохранить')
end

When(/^я удаляю рассылку$/) do
  visit('/sms_deliveries')
  find('#sms_delivery_1_delete').click
  page.driver.browser.switch_to.alert.accept
end