RSpec::Matchers.define :be_displayed do |args|
  match do |actual|
    actual.displayed?(args)
  end

  failure_message_for_should do |actual|
    expected = actual.class.to_s.sub(/PageObjects::/, '')
    expected += " (args: #{args})" if args.count > 0
    "expected to be on page '#{expected}', but was on #{actual.current_path}"
  end
end