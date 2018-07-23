require 'rubygems'
require 'selenium-webdriver'
require 'io/console'
require_relative 'config'


class GoogleForm

  def initialize
    if ARGV[0].nil?
      raise "You gotta enter a date. ie '07-09-2018'"
    else
      @week_of = ARGV[0]
    end
    @google_form_link = 'https://docs.google.com/forms/d/1kJUJmoQPY-TN0tuQLNfRZJPNmJb8INQr4M5y1AXkDEE/viewform?edit_requested=true'
    @first_name = 'Adrian'
    @last_name = 'Horning'
    @driver = Selenium::WebDriver.for :chrome
    @wait = Selenium::WebDriver::Wait.new(timeout: 3)
  end

  def sign_in
    @driver.get 'https://accounts.google.com/signin/v2/identifier?flowName=GlifWebSignIn&flowEntry=ServiceLogin'
    email_input = @driver.find_element(:id, "identifierId")
    sleep(1)
    email_input.send_keys(ENV['email'])
    sleep(1)
    @driver.find_element(:id, 'identifierNext').click
    sleep(1)
    password_input = nil
    password_input = @driver.find_element(:class, "zHQkBf")
    sleep(1)
    password_input.send_keys(ENV['password'])
    @driver.find_element(:id, 'passwordNext').click
    sleep(1)
  end

  def fill_out_form
    @driver.get @google_form_link
    sleep(1)
    @driver.find_element(:xpath, "//input[@name='emailAddress']").send_keys(ENV['email'])
    @driver.find_element(:xpath, "//input[@aria-label='First Name']").send_keys(first_name)
    @driver.find_element(:xpath, "//input[@aria-label='Last Name']").send_keys(last_name)
    @driver.find_element(:xpath, "//input[@type='date']").send_keys(week_of)
    @driver.find_element(:xpath, "//input[@aria-label='Algorithms']").send_keys('4')
    @driver.find_element(:xpath, "//input[@aria-label='Web']").send_keys('1.5')
    @driver.find_element(:xpath, "//input[@aria-label='Javascript']").send_keys('2')
    @driver.find_element(:xpath, "//input[@aria-label='Other']").send_keys('2')
    @driver.find_element(:xpath, "//input[@aria-label='Flashcards']").send_keys('2')
    @driver.find_element(:xpath, "//input[@aria-label='Coding']").send_keys('14')
    @driver.find_element(:xpath, "//input[@aria-label='New Connections']").send_keys('10')
    @driver.find_element(:xpath, "//input[@aria-label='Applications']").send_keys('40')
    @driver.find_element(:xpath, "//input[@aria-label='Leetcode']").send_keys('5')
    @driver.find_element(:xpath, "//input[@aria-label='Whiteboarding']").send_keys('5')
    @driver.find_element(:xpath, "//input[@aria-label='Pramp']").send_keys('5')
    @driver.find_element(:xpath, "//input[@aria-label='Pairboarding']").send_keys('5')
    @driver.find_element(:xpath, "//input[@aria-label='Phone Screens']").send_keys('2')
    @driver.find_element(:xpath, "//input[@aria-label='Phone Screens Next Week']").send_keys('2')
    @driver.find_element(:xpath, "//input[@aria-label='Phone Screen Prep']").send_keys('2')
    @driver.find_element(:xpath, "//input[@aria-label='Coding Challenges']").send_keys('2')
    @driver.find_element(:xpath, "//input[@aria-label='Coding Challenges Next Week']").send_keys('2')
    @driver.find_element(:xpath, "//input[@aria-label='Coding Challenge Time']").send_keys('2')
    @driver.find_element(:xpath, "//input[@aria-label='On-Sites']").send_keys('0')
    @driver.find_element(:xpath, "//input[@aria-label='On-Sites Next Week']").send_keys('0')
    @driver.find_element(:xpath, "//input[@aria-label='Onsite Prep']").send_keys('0')
    @driver.find_element(:class, "freebirdFormviewerViewNavigationSubmitButton").click
  end

  def run
    sign_in
    fill_out_form
    # just so you can see it was submitted
    sleep(10)
  end
end

GoogleForm.new.run
