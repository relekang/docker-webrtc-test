var webdriver = require('selenium-webdriver');
var By = require('selenium-webdriver').By;
var until = require('selenium-webdriver').until;
var Promise = require('bluebird');

var driver = new webdriver.Builder()
  .forBrowser('chrome')
  .build();

var url = process.argv[2];
var time  = parseInt(process.argv[3], 10);

console.log('url: ' + url, 'time: ' + time);

driver.get(url);
driver.wait(function() {
  return new Promise(function(resolve) {
    setTimeout(function() {
      resolve(true);
    }, time);
  });
}, time);
driver.quit();
