AfterStep() do
  if ENV['AFTER_STEP_SCREENSHOT']
    screenshot_and_save_page
  end
end