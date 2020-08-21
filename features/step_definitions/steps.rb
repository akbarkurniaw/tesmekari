require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

Given("open the website") do
  driver.navigate.to "https://www.amazon.com/"
  driver.manage.window.maximize
end

Then("user click Sign in on main menu and click create your Amazon account") do
    driver.find_element(:xpath,'/html[1]/body[1]/div[1]/header[1]/div[1]/div[1]/div[2]/div[1]/a[2]/div[1]/span[1]').click
    driver.find_element(:xpath,'/html/body/div[1]/div[1]/div[2]/div/div[2]/div/span/span/a').click
    sleep(2)
end

Then("user closing the browser") do
    driver.quit
end