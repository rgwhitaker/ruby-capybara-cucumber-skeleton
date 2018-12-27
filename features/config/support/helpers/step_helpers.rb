module PageObjects
  $current_page

  def pollingForContentExistence(text)
    if $max_timeout.nil?
      $max_timeout = 7
    end
    timer = 0
    sleep 1
    while not page.should have_content(text) and timer < $max_timeout
      timer += 1
      puts "Waited for #{timer} second(s) for the text '#{text}' to appear on the page"
      sleep 1
    end
  end

  def waitForAngular(max_wait_time = 7)
    Timeout::timeout(max_wait_time) do
      unless page.current_host.match 'sgate'
        while not pending_async_requests?
          puts "Angular is doing stuff and things"
          sleep 0.1
        end
      end
    end
    puts "Angular is ready"
  end

  def pending_async_requests?
    return page.evaluate_script("window.getAllAngularTestabilities()[0]._isZoneStable")
  end

  def pollingForElementExistenceAndWaitForAngular(element)
    if $max_timeout.nil?
      $max_timeout = 7
    end
    timer = 0
    sleep 1
    while not $current_page.public_send "has_" + convertGherkinElementToPageElement(element) + "?" and timer < $max_timeout
      timer += 1
      puts "Waited for #{timer} second(s) for #{element} to appear"
      sleep 1
    end
    waitForAngular
  end

  def visit_page(name, args = {}, &block)
    build_page(name).tap do |page|
      page.load(args)
      block.call page if block
      $current_page = page
    end
  end

  def on_page(name, args = nil, &block)
    build_page(name).tap do |page|
      expect(page).to have_content(args)
      block.call page if block
      $current_page = page
    end
  end

  def build_page(name)
    name = name.to_s.camelize if name.is_a? Symbol
    Object.const_get("PageObjects::#{name}").new
  end

  def convertRequestedPageNameIntoPageObjectName(requestedPage)
    pageObjectName = requestedPage.downcase.split.map(&:capitalize).join(' ').gsub(/\s+/, "") << 'Page'
    return pageObjectName
  end

  def callElementFromCurrentPageObject(element)
    $current_page.public_send(convertGherkinElementToPageElement(element))
  end

  def convertGherkinElementToPageElement(element)
    element.downcase.tr(" ", "_")
  end

  def run_embedded_steps(embeddedSteps)
    steps embeddedSteps
    puts embeddedSteps
  end

  def pollingForElementExistence(element)
    if $max_timeout.nil?
      $max_timeout = 7
    end
    timer = 0
    sleep 1
    while not $current_page.public_send "has_" + convertGherkinElementToPageElement(element) + "?" and timer < $max_timeout
      timer += 1
      puts "Waited for #{timer} second(s) for #{element} to appear"
      sleep 1
    end
  end

end
