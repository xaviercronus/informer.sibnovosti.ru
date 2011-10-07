Given /^a stream with the following data:$/ do |table|
  When %{I signed in as manager}
  Then   %{I create a stream with the following data:}, table
  And   %{I am signed out}
end

Given /^I create a stream with the following data:$/ do |table|
  When %{I go to the streams page}
  Then %{I follow "Create new stream"}
  
  When %{I fill in the following:}, table
  And  %{I press "Create new stream"}
  
  Then %{I should see "Stream successfully created."}
end

