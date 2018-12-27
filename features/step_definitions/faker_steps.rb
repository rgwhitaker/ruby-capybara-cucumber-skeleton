When(/^I fill in "([^"]*)" with a US phone number$/) do |element|
  Faker::Config.locale = 'en-US'
  phoneNumber = Faker::PhoneNumber.area_code + Faker::PhoneNumber.exchange_code + Faker::PhoneNumber.subscriber_number
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(phoneNumber)
end

When(/^I fill in "([^"]*)" with an occupation$/) do |element|
  occupation = Faker::Job.title
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(occupation)
end

When(/^I fill in "([^"]*)" with a number between 1 and 30$/) do |element|
  number = Faker::Number.between(1, 30)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(number)
end

When(/^I fill in "([^"]*)" with a street address$/) do |element|
  address = Faker::Address.street_address
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(address)
end

When(/^I fill in "([^"]*)" with a secondary address$/) do |element|
  address = Faker::Address.secondary_address
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(address)
end

When(/^I fill in "([^"]*)" with a city$/) do |element|
  city = Faker::Address.city
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(city)
end

When(/^I fill in "([^"]*)" with a US annual income$/) do |element|
  number = Faker::Number.between(1, 10000000)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(number)
end

When(/^I fill in "([^"]*)" with a MX annual income$/) do |element|
  number = Faker::Number.between(1, 180000000)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(number)
end

When(/^I fill in "([^"]*)" with a US other income$/) do |element|
  number = Faker::Number.between(1, 10000)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(number)
end

When(/^I fill in "([^"]*)" with a negative number between -10000000 and -1$/) do |element|
  number = Faker::Number.between(-10000000, -1)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(number)
end

When(/^I fill in "([^"]*)" with business name$/) do |element|
  @businessname = Faker::Company.name
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(@businessname)
end

When(/^I fill in "([^"]*)" with name$/) do |element|
  @name = Faker::Name.name
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(@name)
end

When(/^I fill in "([^"]*)" with prefix$/) do |element|
  @prefix = Faker::Name.prefix
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(@prefix)
end

When(/^I fill in "([^"]*)" with suffix$/) do |element|
  @suffix = Faker::Name.suffix
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(@suffix)
end

When(/^I fill in "([^"]*)" with middle name$/) do |element|
  @middle_name = Faker::Name.name_with_middle
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(@middle_name)
end

When(/^I fill in "([^"]*)" with numeric value$/) do |element|
  @number = Faker::Number.decimal(3,2)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(@number)
end

When(/^I fill in "([^"]*)" with six digit numeric value$/) do |element|
  @number = Faker::Number.decimal(6,2)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(@number)
end

When(/^I fill in "([^"]*)" with negative numeric value$/) do |element|
  negativeNumber = Faker::Number.negative
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(negativeNumber)
end

When(/^I fill in "([^"]*)" with a state abbrivation/) do |element|
  stateabbr = Faker::Address.state_abbr
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(stateabbr)
end

When(/^I fill in "([^"]*)" with a country$/) do |element|
  country = Faker::Address.country
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(country)
end

When(/^I fill in "([^"]*)" with first name$/) do |element|
  @first_name = Faker::Name.first_name
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(@first_name)
end

When(/^I fill in "([^"]*)" with last name$/) do |element|
  @last_name = Faker::Name.last_name
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(@last_name)
end

When(/^I fill in "([^"]*)" with a number between 1 and 11$/) do |element|
  number = Faker::Number.between(1, 11)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(number)
end

When(/^I fill in "([^"]*)" with an email address$/) do |element|
  @email = Faker::Internet.email
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(@email)
end

When(/^I fill in "([^"]*)" with industry type$/) do |element|
  industry = Faker::Company.industry
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(industry)
end

When(/^I fill in "([^"]*)" with a number between 12 and 99$/) do |element|
  number = Faker::Number.between(12, 99)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(number)
end

When(/^I fill in "([^"]*)" with duns number$/) do |element|
  duns = Faker::Company.duns_number
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(duns)
end

When(/^I fill in "([^"]*)" with business taxid$/) do |element|
  taxid = Faker::Number.number(9)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(taxid)
end

When(/^I fill in "([^"]*)" with banking account number$/) do |element|
  accnumber = Faker::Number.number(18)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(accnumber)
end

When(/^I fill in "([^"]*)" with bank name$/) do |element|
  bankname = Faker::Bank.name
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(bankname)
end

When(/^I fill in "([^"]*)" with zipcode$/) do |element|
  zipcode = Faker::Number.number(5)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(zipcode)
end

When(/^I fill in "([^"]*)" with a non zero digit$/) do |element|
  non_zero_number = Faker::Number.non_zero_digit
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(non_zero_number)
end

When(/^I fill in "([^"]*)" with five decimal point$/) do |element|
  @number = Faker::Number.decimal(1,5)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(@number)
end

When(/^I fill in "([^"]*)" with vehicle model$/) do |element|
  model = Faker::Vehicle.manufacture
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(model)
end

When(/^I fill in "([^"]*)" with vehicle mileage$/) do |element|
  mileage = Faker::Vehicle.mileage
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(mileage)
end

When(/^I fill in "([^"]*)" with msrp value$/) do |element|
  number = Faker::Number.between(10000, 40000)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(number)
end

When(/^I fill in "([^"]*)" with monthly payment$/) do |element|
  number = Faker::Number.between(500, 2000)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(number)
end

When(/^I fill in "([^"]*)" with decimal point$/) do |element|
  @number = Faker::Number.decimal(0,2)
  pollingForElementExistenceAndWaitForAngular(element)
  $current_page.public_send(element.downcase.tr(" ", "_")).send_keys(@number)
end