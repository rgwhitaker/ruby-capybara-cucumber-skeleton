When(/^I select "([^"]*)" from "([^"]*)"$/) do |text, element|
  pollingForElementExistenceAndWaitForAngular(element)
  callElementFromCurrentPageObject(element).click
  callElementFromCurrentPageObject(element).find(:xpath, "//*[contains(text(),'" + text + "')]").click
end