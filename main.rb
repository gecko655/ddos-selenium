require "selenium-webdriver"
require 'logger'

logger = Logger.new(STDOUT)

hostname = ENV["Hostserver_Hostname"]
raise ArgumentError "usage: ruby #{$0} url" unless ARGV[0]
url = ARGV[0]

logger.info("Initializing")
driver = Selenium::WebDriver.for :remote, :url => "http://"+hostname+":4444/wd/hub", :desired_capabilities => :chrome
begin
  driver.manage.timeouts.implicit_wait = 10

  logger.info("Accessing to the page: "+url)
  driver.navigate.to url
  logger.info("done")
ensure 
  sleep 3 
  driver.quit
end
