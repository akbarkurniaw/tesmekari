require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
driver.manage.window.maximize

Given("user click Sign in on main menu") do
  driver.navigate.to "https://www.amazon.com/"
  sleep(1)
  driver.find_element(:id,'nav-link-accountList').click
  sleep(1)    
end

Then("user fill Sign In form with Registered email and Continue") do
custemail = driver.find_element(:name, "email")
custemail.send_keys("akbarkurn@yahoo.co.id")
driver.find_element(:xpath,'/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div[1]/form/div/div/div/div[2]/span/span/input').click
sleep(1)
end

Then("user fill wrong Password and Sign In") do
custpass = driver.find_element(:name, "password")
custpass.send_keys("password321")
driver.find_element(:id,'signInSubmit').click
sleep(1)
end

Then ("Verify Alert Wrong Password") do
alert1 = wait.until {
  element = driver.find_element(:xpath, '/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]')
  element if element.displayed?
}
puts "Success Verify Alert Wrong Password" if alert1.displayed?
end

When("user fill Sign In form with Unregistered email and Continue") do
custemail = driver.find_element(:name, "email")
custemail.send_keys("akbarkurn@gmail.com")
driver.find_element(:xpath,'/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div[1]/form/div/div/div/div[2]/span/span/input').click
sleep(1)
end

Then ("Verify Alert Cannot Find Account") do
alert1 = wait.until {
  element = driver.find_element(:xpath, '/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]')
  element if element.displayed?
}
puts "Success Verify Alert Cannot Find Account" if alert1.displayed?
end

Given("user click Sign up on main menu and click create your Amazon account") do
  driver.navigate.to "https://www.amazon.com/"
  sleep(1)
  driver.find_element(:id,'nav-link-accountList').click
  sleep(1)
  driver.find_element(:id,'createAccountSubmit').click
  
end

Then("user fill Sign Up form") do
custname = driver.find_element(:name, "customerName")
custname.send_keys("Akbar Kurnia W")
custemail = driver.find_element(:name, "email")
custemail.send_keys("akbarkurn@gmail.com")
custpass = driver.find_element(:name, "password")
custpass.send_keys("passw776655")
custrepass = driver.find_element(:name, "passwordCheck")
custrepass.send_keys("passw776655")
sleep(1)
end

Then("user Click Create Account") do
driver.find_element(:xpath,'/html/body/div[1]/div[1]/div[2]/div/div[2]/div/form/div/div/div[4]/span/span/input').click
end

When("user empty Sign Up form") do
custname = driver.find_element(:name, "customerName")
custname.send_keys("")
custemail = driver.find_element(:name, "email")
custemail.send_keys("")
custpass = driver.find_element(:name, "password")
custpass.send_keys("")
custrepass = driver.find_element(:name, "passwordCheck")
custrepass.send_keys("")
sleep(1)
end

Then("Verify Alert") do
alert1 = wait.until {
  element = driver.find_element(:xpath, '/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]')
  element if element.displayed?
}
alert2 = wait.until {
  element = driver.find_element(:xpath, '/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]')
  element if element.displayed?
}
alert3 = wait.until {
  element = driver.find_element(:xpath, '/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[1]')
  element if element.displayed?
}
puts "Success Verify Alert enter your name" if alert1.displayed?
puts "Success Verify Alert enter your email" if alert2.displayed?
puts "Success Verify Alert enter your password" if alert3.displayed?

end


