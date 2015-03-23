var webdriver = require('selenium-webdriver');
var By = require('selenium-webdriver').By;
var until = require('selenium-webdriver').until;

var driver = new webdriver.Builder()
  .forBrowser('firefox')
  .build();

driver.get('http://aberfort.lkng.me/');
driver.wait(1000 * 60 * 10);
driver.quit();
