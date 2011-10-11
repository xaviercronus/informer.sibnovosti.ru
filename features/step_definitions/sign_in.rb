Given /^I am not signed in$/ do
  Given %{I go to the sign out page}
  And   %{I go to the home page}
end

Given /^I am signed out$/ do
  And %{I am not signed in}
end

Given /^I am signed in with the following data:$/ do |table|
  When %{I go to the sign in page}
  And  %{I fill in the following:}, table
  Then %{I press "Sign in"}
end