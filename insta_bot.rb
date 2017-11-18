require 'watir'
require 'date'
require_relative 'lista'

username = "feting.fettsson"
password = "haha1234"
tags = ["hihi haha detta är så du", "huehue du asså", "kim jong uns farsa va mycket du detta är", "satan i helvete detta är DU", "dRA åt HELVETE VA MYCKET DETTA ÄR DuuuUUUUU", "jävlarns järnspikar vad mycket du!!1!", "mEN HÄLL VETEMJöL I DEGEN VAD DU DETTA ÄR"].sample
com = tags + " " + "@robinorten"

browser = Watir::Browser.new :chrome, headless: true

browser.goto "instagram.com/accounts/login"

browser.text_field(:name => "username").set "#{username}"
browser.text_field(:name => "password").set "#{password}"

browser.button(:class => ["_qv64e _gexxb _4tgw8 _njrw0"]).click
sleep(1)

browser.refresh

pdate = browser.element(:tag_name, 'time').attribute_value('datetime')
date = DateTime.now.to_date.to_s
if pdate.include? date
    browser.textarea(:class => "_bilrf").set com
    sleep(1)
    browser.send_keys :enter
end