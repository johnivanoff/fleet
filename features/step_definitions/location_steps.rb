Given /^I am on new location page$/ do
  visit(new_location_path)
end

Given /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Given /^press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end


Given /^there is a location named "([^"]*)"$/ do |name|
  Factory(:location, :name => name)
end

When /^I change the location name to "([^"]*)"$/ do |name|
  visit(locations_path)
  within("ul li:nth-child(1)") do
    click_link "Edit"
  end
  fill_in('Name', :with => name)
  click_button('Update')
end

Given /^the following (.+) records?$/ do |factory, table|
  table.hashes.each do |hash|
    Factory(factory, hash)
  end
end

When /^I delete the (\d+)(?:st|nd|rd|th) (.+)$/ do |pos, model|
  tempPath = '/' + model + 's'
  visit tempPath # assets_path
  within("ul li:nth-child(#{pos.to_i})") do
    click_link "Destroy"
  end
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end

Given /^I am on the "([^"]*)" page$/ do |location|
  visit(location_path(Location.find_by_name(location)))
end

