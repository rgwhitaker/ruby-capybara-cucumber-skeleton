require 'base64'

Given(/^I have navigated to the "([^"]*)" page$/) do |desired_page|
  visit_page(convertRequestedPageNameIntoPageObjectName(desired_page))
end

Then(/^I am on the "([^"]*)" page$/) do |expected_page|
  on_page(convertRequestedPageNameIntoPageObjectName(expected_page))
end

Then(/^I see the element "(.*?)" with the text "(.*?)"$/) do |element, text|
  pollingForElementExistence(element)
  page.should have_css(element, text: text)
end

Then(/^the page contains the following content "(.*?)"$/) do |text|
  page.should have_content(text)
end

Then(/^the "([^"]*)" has the text "([^"]*)"$/) do |element, text|
  pollingForElementExistence(element)
  callElementFromCurrentPageObject(element).text.should match(text)
end

And(/^"([^"]*)" is not displayed$/) do |element|
  expect($current_page).to public_send("have_no_#{convertGherkinElementToPageElement(element)}")
end

And(/^"([^"]*)" is disabled$/) do |element|
  pollingForElementExistence(element)
  callElementFromCurrentPageObject(element).disabled?
end

And(/^"([^"]*)" is blank$/) do |element|
  pollingForElementExistence(element)
  callElementFromCurrentPageObject(element).value.blank?
end

Then(/^"([^"]*)" is displayed$/) do |element|
  callElementFromCurrentPageObject(element).should be_visible
end

When(/^I select the "([^"]*)" button$/) do |button|
  click_button(button)
end

When(/^I select the "([^"]*)" link$/) do |link|
  click_link(link)
end

When(/^I fill in "([^"]*)" with the text "([^"]*)"$/) do |element, text|
  pollingForElementExistence(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(text)
end

And(/^I click on "([^"]*)"$/) do |element|
  pollingForElementExistence(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).click
end

When(/^I fill in "([^"]*)" with some name$/) do |element|
  text = Faker::StarWars.character
  pollingForElementExistence(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(text)
end

When(/^I fill in "([^"]*)" with the encoded text "([^"]*)"$/) do |element, text|
  decodedText = Base64.decode64(text)
  pollingForElementExistence(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(decodedText)
end

When(/^I select "([^"]*)" from the "([^"]*)"$/) do |text, element|
  pollingForElementExistence(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).find(:xpath, "//*[contains(text(),'" + text + "')]").click
end

Given(/^I set the max timeout for each step to "([^"]*)" seconds$/) do |time|
  $max_timeout = time.to_i
end