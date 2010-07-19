When /^I click "([^"]*)"$/ do |link|
  click(link)
end

Then /^the detailed info should be visible$/ do
  evaluate_script('$(".details").first().css("display");').should == "block"
end
