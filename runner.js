var webdriver = require('selenium-webdriver');
var By = require('selenium-webdriver').By;
var until = require('selenium-webdriver').until;

var driver = new webdriver.Builder()
  .forBrowser('chrome')
  .build();

driver.get('http://aberforth.lkng.me/');

// wait 10 minutes
driver.wait(function() { }, 1000 * 60 * 10);
driver.quit();
