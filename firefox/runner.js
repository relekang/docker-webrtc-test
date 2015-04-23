var webdriver = require('selenium-webdriver');
var By = require('selenium-webdriver').By;
var until = require('selenium-webdriver').until;
var Promise = require('bluebird');

var FirefoxProfile = require('firefox-profile');
var profile = new FirefoxProfile();
profile.setPreference('geo.prompt.testing', true);
profile.setPreference('geo.prompt.testing.allow', true);
profile.updatePreferences();

var url = process.argv[2];
var time  = parseInt(process.argv[3], 10);
var capabilities = webdriver.Capabilities.firefox();
profile.encoded(function(encodedProfile) {
  capabilities.set('firefox_profile', encodedProfile);

  console.log('url: ' + url, 'time: ' + time);
  console.log(new Array(41).join('-'));

  var driver = new webdriver.Builder()
    .forBrowser('firefox')
    .withCapabilities(capabilities)
    .build();

  driver.get(url);
  driver.wait(function() {
    return new Promise(function(resolve) {
        setTimeout(function() {
          resolve(true);
        }, time);
    });
  }, time + 10);
  driver.quit();

});
