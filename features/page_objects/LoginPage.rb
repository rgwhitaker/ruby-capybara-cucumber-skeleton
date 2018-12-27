  module PageObjects
  class LoginPage < SitePrism::Page

    set_url '/'

    element :username_field, 'input[name=USER]'
    element :password_field, 'input[name=PASSWORD]'
    element :login_button, '#loginbutton'
  end
end