When(/^я создаю учетную запись с данными:$/) do |table|
  visit('/sms_service_accounts/new')
  within('#new_sms_service_account') do
    fill_in 'sms_service_account[login]', with: table.hashes[0][:login]
    fill_in 'sms_service_account[password]', with: table.hashes[0][:password]
    fill_in 'sms_service_account[senders_attributes][0][name]', with: table.hashes[0][:name]
  end
  click_button 'Сохранить'
end

When(/^я вижу на странице введенные данные:$/) do |table|
  assert page.has_content?(table.hashes[0][:login])
  assert page.has_content?(table.hashes[0][:password])
  assert page.has_content?(table.hashes[0][:name])
end

When(/^я выбираю учетную запись и меняю её название на "([^"]*)"$/) do |login|
  visit('/sms_service_accounts')
  find('#sms_service_account_1_edit').click
  within('#edit_sms_service_account_1') do
    fill_in 'sms_service_account[login]', with: login
    fill_in 'sms_service_account[password]', with: 'password'
  end
  click_button 'Сохранить'
end

When(/^я удаляю учетную запись$/) do
  visit('/sms_service_accounts')
  find('#sms_service_account_1_delete').click
  page.driver.browser.switch_to.alert.accept
end