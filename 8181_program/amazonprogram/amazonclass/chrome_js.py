from selenium import webdriver
from bs4 import BeautifulSoup
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait
import time

browser = webdriver.Chrome('/snap/bin/chromium.chromedriver')

browser.get("https://www.amazon.com")
time.sleep(3)
print(browser.current_url)
print(browser.get_cookies())
# print(browser.page_source)
# soup = BeautifulSoup(browser.page_source, 'lxml')
# register_url = soup.select('#nav-signin-tooltip .nav-a')
# print(register_url)
# print(browser.find_element_by_id('nav-flyout-ya-newCust'))
# print(browser.find_element_by_class_name('#nav-signin-tooltip .nav-a'))
browser.find_element_by_link_text("Start here.").click()
# time.sleep(3)
# # links = browser.find_element.by_xpath('//a[@class="login"]')
# links = driver.find_element_by_xpath('//a[@class="home"]').click()
# time.sleep(3)


