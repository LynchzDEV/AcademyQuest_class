Then('I should be on the quests page') do
  expect(page).to have_current_path(quests_path)
end

Then('I should be on the new quest page') do
  expect(page).to have_current_path(new_quest_path)
end

Then('I should be on the edit quest page for {string}') do |quest_name|
  quest = Quest.find_by(name: quest_name)
  expect(page).to have_current_path(edit_quest_path(quest))
end
