Then('I should see a button {string}') do |button_text|
  expect(page).to have_button(button_text)
end

Then('I should see a link {string}') do |link_text|
  expect(page).to have_link(link_text)
end

Then('I should see an element with text {string}') do |text|
  expect(page).to have_css("*", text: text)
end
