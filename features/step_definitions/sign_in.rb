Given /^I am not signed in$/ do
  Given %{I go to the sign out page}
  And   %{I go to the home page}
end

Given /^I am signed out$/ do
  And %{I am not signed in}
end
