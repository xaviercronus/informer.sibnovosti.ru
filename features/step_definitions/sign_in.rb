Given /^I am not signed in$/ do
  Given %{I go to the sign out page}
  And   %{I go to the home page}
end

Given /^I am signed out$/ do
  And %{I am not signed in}
end

Given /^I am signed in with the following data:$/ do |table|
  When %{I go to the home page}
  And  %{I follow "Sign in"}
  And  %{I fill in the following:}, table
  Then %{I press "Sign in"}
end

Then /^I should be signed in as "([^"]*)"$/ do |name|
  Then %{I should see "#{name} - is you."}
end