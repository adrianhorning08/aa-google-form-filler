require 'rubygems'
require 'selenium-webdriver'
require 'io/console'
require_relative 'config'

google_form_link = 'https://docs.google.com/forms/d/e/1FAIpQLScttB5RLW7CehuwY8UxBGBS3kI4nAYD88ZVTE7iHTudt5JDSA/viewform'
week_of = '07-02-2018'

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(timeout: 3)

driver.get 'https://accounts.google.com/signin/v2/identifier?flowName=GlifWebSignIn&flowEntry=ServiceLogin'
email_input = driver.find_element(:id, "identifierId")
sleep(2)
email_input.send_keys(ENV['email'])
sleep(2)
driver.find_element(:id, 'identifierNext').click
sleep(2)
password_input = nil
password_input = driver.find_element(:class, "zHQkBf")
sleep(2)
password_input.send_keys(ENV['password'])
driver.find_element(:id, 'passwordNext').click
sleep(2)
driver.get google_form_link
sleep(2)

driver.find_element(:xpath, "//input[@name='emailAddress']").send_keys(ENV['email'])
driver.find_element(:xpath, "//input[@aria-label='First Name']").send_keys('Adrian')
driver.find_element(:xpath, "//input[@aria-label='Last Name']").send_keys('Horning')
driver.find_element(:xpath, "//input[@type='date']").send_keys(week_of)
driver.find_element(:xpath, "//input[@aria-label='Algorithms']").send_keys('4')
driver.find_element(:xpath, "//input[@aria-label='Web']").send_keys('1.5')
driver.find_element(:xpath, "//input[@aria-label='Javascript']").send_keys('2')
driver.find_element(:xpath, "//input[@aria-label='Other']").send_keys('2')
driver.find_element(:xpath, "//input[@aria-label='Flashcards']").send_keys('2')
driver.find_element(:xpath, "//input[@aria-label='Coding']").send_keys('14')
driver.find_element(:xpath, "//input[@aria-label='New Connections']").send_keys('10')
driver.find_element(:xpath, "//input[@aria-label='Applications']").send_keys('40')
driver.find_element(:xpath, "//input[@aria-label='Leetcode']").send_keys('5')
driver.find_element(:xpath, "//input[@aria-label='Whiteboarding']").send_keys('5')
driver.find_element(:xpath, "//input[@aria-label='Pramp']").send_keys('5')
driver.find_element(:xpath, "//input[@aria-label='Pairboarding']").send_keys('5')
driver.find_element(:xpath, "//input[@aria-label='Phone Screens']").send_keys('2')
driver.find_element(:xpath, "//input[@aria-label='Phone Screens Next Week']").send_keys('2')
driver.find_element(:xpath, "//input[@aria-label='Phone Screen Prep']").send_keys('2')
driver.find_element(:xpath, "//input[@aria-label='Coding Challenges']").send_keys('2')
driver.find_element(:xpath, "//input[@aria-label='Coding Challenges Next Week']").send_keys('2')
driver.find_element(:xpath, "//input[@aria-label='Coding Challenge Time']").send_keys('2')
driver.find_element(:xpath, "//input[@aria-label='On-Sites']").send_keys('0')
driver.find_element(:xpath, "//input[@aria-label='On-Sites Next Week']").send_keys('0')
driver.find_element(:xpath, "//input[@aria-label='Onsite Prep']").send_keys('0')
driver.find_element(:xpath, "//div[@role='button']").click

driver.quit
