assert = require 'assert'
test = require 'selenium-webdriver/testing'
webdriver = require 'selenium-webdriver'


test.describe 'Adslot website', ->

  # Browser (or driver) instance
  browser = null

  # Init browser before we begin
  test.before -> browser = new webdriver.Builder().usingServer().withCapabilities({browserName: 'chrome'}).build()

  # Close browser after all tests
  test.after -> browser.quit()


  test.it 'should have 8 offices on careers page', ->

    browser.get 'http://adslot.com/careers'

    browser.findElements(webdriver.By.css('.ui-tabs-nav h4, .ui-tabs-nav h2')).then (menuItems) ->
      assert menuItems.length, 8


  test.it 'should contain a form on "contact us" page', ->

    browser.get 'http://www.adslot.com/contact-us'

    browser.findElement(webdriver.By.id('first_name')).isDisplayed()
    browser.findElement(webdriver.By.id('last_name')).isDisplayed()
    browser.findElement(webdriver.By.id('message')).isDisplayed()
    browser.findElement(webdriver.By.css('button[type=submit]')).isDisplayed()

    #Selenium test for Contact Us page
    
    test.it 'test for Contact Form fields', ->

    browser.get 'http://www.adslot.com/contact-us'
    
    boolean status = browser.findElement(webdriver.By.id('first_name')).isDisplayed()
    boolean status1 = browser.findElement(webdriver.By.id('last_name')).isDisplayed()
    boolean status2 = browser.findElement(webdriver.By.id('email')).isDisplayed()
    boolean status3 = browser.findElement(webdriver.By.id('website')).isDisplayed()
    boolean status4 = browser.findElement(webdriver.By.id('description')).isDisplayed()
    boolean status5 = browser.findElement(webdriver.By.name('submit')).isDisplayed()
    boolean status6 = browser.findElement(webdriver.By.id('00N90000004oGQH')).isDisplayed()
    
    #Selenium Page Title test
    test.it 'Adlost Page title test', ->
    
    browser.get 'https://www.google.com.au/'
    browser.findElement(webdriver.By.id('lst-ib')).sendKeys('Adslot')
    List<WebElement> links = broswer.findElement(webdriver.By.tagname('a'))
    WebElement firstlink = links.get(0)    
    String pageTitle = firstlink.getText()
    if (pageTitle == 'Adslot')
    return true
    else 
    return false
  
  #Custom Selenium test
  test.it 'social Media links', ->
  
  browser.get 'https://www.adslot.com/'
  WebElement twitterLink = browser.findElement('webdriver.By.tagname('//a[text() = 'Twitter')')
  twitterLink.click();
  String twitterURLActual = browser.getCurrentUrl() 
  String twitterURLExpected = "https://twitter.com/adslot"
  if(twitterURLActual == twitterURLExpected)
  return true
  else
  return false
 
  WebElement facebookLink = browser.findElement('webdriver.By.tagname('//a[text() = 'Facebook')')
  facebookLink.click()
  String fbURLActual = browser.getCurrentUrl() 
  String fbURLExpected = "https://www.facebook.com/Adslot"
  if(fbURLActual == fbURLExpected)
  return true
  else                                             
  return false
 
  WebElement linkedInLink = browser.findElement('webdriver.By.tagname('//a[text() = 'Linkedin')')
  linkedInLink.click()
  String linkedinURLActual = browser.getCurrentUrl() 
  String linkedinURLExpected = "https://www.linkedin.com/company/adslot"
  if(linkedinURLActual == linkedinURLExpected)
  return true
  else                                             
  return false


  
                      
  
    
    
    
    
