Given /^a manager with the following data:$/ do |data|
  When %{I signed in as admin}
  Then %{I create a manager with the following data:}, data
  And  %{I am signed out}
  
  data_hash = data.rows_hash
  
  When %{I go to the home page}
  And  %{I follow "Sign in"}
  And  %{I fill in "Email" with "#{data_hash["Email"]}"}
  And  %{I fill in "Password" with "#{data_hash["Password"]}"}
  And  %{I press "Sign in"}
end