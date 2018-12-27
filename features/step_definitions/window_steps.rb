And(/^I switch to the "([^"]*)" opened window$/) do |page_order|
  if page_order.downcase == 'last'
    switch_to_window(windows.last)
  elsif page_order.downcase == 'first'
    switch_to_window(windows.first)
  else
    raise 'the opened window must either be first or last'
  end
end

And(/^I close the "([^"]*)" opened window$/) do |page_order|
  if page_order.downcase == 'last'
    windows.last.close
  elsif page_order.downcase == 'first'
    windows.first.close
  else
    raise 'the closed window must either be first or last'
  end
end
