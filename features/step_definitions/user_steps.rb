Given /^I am signed in as manager$/ do
  When %{I signed in as admin}
  Then %{I create a manager}
  And  %{I am signed out}
  
  When %{I go to the sign in page}
  And  %{I fill in "Email" with "manager@example.com"}
  And  %{I fill in "Password" with "password"}
  And  %{I press "Sign in"}
end

Given /^I signed in as admin$/ do
  Given %{I am not signed in}
  
  user = User.create! :email                 => 'admin@example.com',
                      :name                  => 'Admin',
                      :password              => 'password',
                      :password_confirmation => 'password',
                      :role                  => :admin
                      
  Then %{I go to the sign in page}
  When %{I fill in "Email" with "admin@example.com"}
  And  %{I fill in "Password" with "password"}
  When %{I press "Sign in"}
end

Given /^I create a manager$/ do
  When %{I go to the users page}
  Then %{I follow "Create new user"}
    
  When %{I fill in "Name" with "Manager"}
  And  %{I fill in "Email" with "manager@example.com"}
  And  %{I fill in "Password" with "password"}
  And  %{I fill in "Password confirmation" with "password"}
  And  %{I select "manager" from "Role"}
  
  When %{I press "Create new user"}
  Then %{I should be on the users page}
  And  %{I should see "Manager successfully created."}
  And  %{I should see "Manager"}
  And  %{I should see "manager@example.com"}
end