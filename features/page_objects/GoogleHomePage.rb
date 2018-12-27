module PageObjects
  class GoogleHomePage < SitePrism::Page

    set_url 'http://www.google.com'

    element :the_search_field, 'input[name=q]'
    element :the_google_search_button, 'input[name=btnK]'
  end
end