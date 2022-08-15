# #!/usr/bin/env python

import logging
from gettext import find
from telnetlib import theNULL
from selenium import webdriver
from selenium.webdriver.common.by import By
global driver
# Start the browser and navigate to http://automationpractice.com/index.php.

user = "standard_user"
password = "secret_sauce"
driver = webdriver.Chrome()
url = "https://www.saucedemo.com/"
print   ("Navigating to URL " + url)

driver.get(url)

print( 'Loging in to https://www.saucedemo.com/ ')
driver.find_element(By.CSS_SELECTOR,'input[data-test="username"]').send_keys(user)
driver.find_element(By.CSS_SELECTOR,'input[data-test="password"]').send_keys(password)
driver.find_element(By.CSS_SELECTOR,'input[value=Login]').click()

print('Searching for Products.')
headerLabel = driver.find_element(By.CLASS_NAME,'header_secondary_container').text
print("headerlabel = " + headerLabel)
assert "PRODUCTS" in headerLabel
logging.info('Successfully logged in ' + user + '.')
logging.info('Selecting products.')
products = driver.find_elements(By.CSS_SELECTOR,'.inventory_item')
for product in products:
    product_name = product.find_element(By.CSS_SELECTOR,'.inventory_item_name').text
    print(product_name + ' adding to card')
    product.find_element(By.CSS_SELECTOR,'button.btn_inventory').click()
    logging.info(product_name + ' successfully added to cart.')

logging.info('Verifying if cart has been populated with 6 products.')
cart_label = driver.find_element(By.CSS_SELECTOR,'.shopping_cart_badge').text
assert cart_label == '6'
logging.info('Navigating to shopping cart.')
driver.find_element(By.CSS_SELECTOR,'.shopping_cart_link').click()
assert '/cart.html' in driver.current_url, 'Navigation to shopping cart unsuccessful.'
logging.info('Removing products from cart.')
cart_products = driver.find_elements(By.CSS_SELECTOR,'.cart_item')

for product in cart_products:
    product_name = product.find_element(By.CSS_SELECTOR,'.inventory_item_name').text
    print(product_name + ' removing from card')
    product.find_element(By.CSS_SELECTOR,'button.cart_button').click()
    logging.info(product_name + ' successfully removed from cart.')
       
logging.info('Confirming that shopping cart is empty.')
badgeValue = driver.find_elements(By.CSS_SELECTOR,'.shopping_cart_badge')
cart_emptiness_flag = False
if len(badgeValue) == 0:
    cart_emptiness_flag = True
else:
    cart_emptiness_flag = False
assert cart_emptiness_flag == True
logging.info('Shopping cart successfully emptied: ' + str(cart_emptiness_flag))