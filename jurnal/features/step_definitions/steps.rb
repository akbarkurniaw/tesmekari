require 'selenium-webdriver'
require 'rubygems'
require 'rspec'


driver = Selenium::WebDriver.for:chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
driver.manage.window.maximize
driver.navigate.to "http://sandbox.jurnal.id/"

Given("User Log In to Journal") do
    email = driver.find_element(:name, "user[email]")
    email.send_keys("akbarkurn@gmail.com")
    pass = driver.find_element(:name, "user[password]")
    pass.send_keys("AkbarTes123")
    driver.find_element(:id,'new-signin-button').click
end

Then("User Create Sales Invoice") do
    driver.find_element(:id,'vnav-sales-link').click
    driver.find_element(:xpath, '/html/body/div[2]/div[4]/div[5]/section/div[2]/div/div[2]/div[2]/div/div[1]/div[2]/div/div[2]/a[1]').click
end

Then("User Add New Customer from Dropdown") do
    driver.find_element(:id,'select2-chosen-19').click
    sleep(2)

    select_list = wait.until {
    element = driver.find_element(:id, 'select2-result-label-29')
    element if element.displayed?
    }
    select_list.clear

    options=select_list.find_elements(:tag_name => "option")
 
    options.each do |g|
        if g.text == "abc"
        g.click
        break
        end
      end

    driver.find_element(:xpath,'/html/body/div[2]/div[4]/div[4]/section/div/div/form/div[2]/div[1]/div/div/div[2]/ul/li/div').click
    pname = driver.find_element(:name, "person[display_name]")
    pname.send_keys("akbartes")
    pemail = driver.find_element(:name, "person[email]")
    pemail.send_keys("akbartes@gmail.com")
    padd = driver.find_element(:name, "person[billing_address]")
    padd.send_keys("Kota Bogor")
    pphone = driver.find_element(:name, "person[phone]")
    pphone.send_keys("08123456789")
    driver.find_element(:id,'aodc-add').click
end

Then("User Select Transaction Date") do
  driver.find_element(:id,'transaction_transaction_date').click
  driver.find_element(:xpath, "//th[contains(text(),'August 2020')]").click
  sleep(10)
end

  

