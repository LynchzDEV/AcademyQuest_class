Given('there are no quests') do
  Quest.destroy_all
end

Given('there is a quest named {string}') do |name|
  Quest.create!(name: name)
end

When('I visit the quests index page') do
  visit quests_path
end

Then('I should see {string}') do |text|
  expect(page).to have_content(text)
end

Then('I should see {string} as the page title') do |title|
  expect(page).to have_css('h1', text: title)
end

Then('I should not see {string}') do |text|
  expect(page).not_to have_content(text)
end

Then('I should see a link to create a new quest') do
  expect(page).to have_link('New quest')
end

When('I click on {string}') do |link_text|
  click_on(link_text)
end

When('I click on {string} for {string}') do |link_text, quest_name|
  within("##{dom_id(Quest.find_by(name: quest_name))}").find(:xpath, '..') do
    click_on(link_text)
  end
end

Then('I should see the new quest form') do
  expect(page).to have_selector('form')
  expect(page).to have_field('Name')
  expect(page).to have_button('Create Quest')
end

When('I fill in {string} with {string}') do |field, value|
  fill_in(field, with: value)
end

# Helper method to get the DOM ID for a record
def dom_id(record)
  ActionView::RecordIdentifier.dom_id(record)
end

# Additional step definitions for quest status

When('I check {string}') do |checkbox_label|
  check(checkbox_label)
end

When('I uncheck {string}') do |checkbox_label|
  uncheck(checkbox_label)
end

Then('I should see the quest is {string}') do |status|
  expect_status = status == "completed" ? "Yes" : "No"
  expect(page).to have_content("Status: #{expect_status}")
end

# Steps for verifying flash messages
Then('I should see a success message {string}') do |message|
  expect(page).to have_css(".bg-green-50", text: message)
end

# Steps for testing the brag functionality
When('I click on the brag button') do
  click_on("Brag")
end

Then('I should be on the brag page') do
  expect(page).to have_current_path(brag_path)
end

# Steps for handling confirmation dialogs
When('I confirm the dialog') do
  page.driver.browser.switch_to.alert.accept
end

When('I dismiss the dialog') do
  page.driver.browser.switch_to.alert.dismiss
end
