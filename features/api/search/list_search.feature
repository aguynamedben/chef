@api @data @api_search @api_search_list
Feature: List search endpoints via the REST API
  In order to know what search endpoints exist programatically
  As a Developer
  I want to list all the search indexes 

  Scenario: List search indexes when no data bags have been created
    Given a 'registration' named 'bobo' exists
      And there are no data bags
     When I authenticate as 'bobo'
      And I 'GET' the path '/search' 
     Then the inflated responses key 'node' should match '^http://(.+)/search/node$'     
      And the inflated responses key 'role' should match '^http://(.+)/search/role$'
      And the inflated responses key 'client' should match '^http://(.+)/search/client$'
      And the inflated response should be '3' items long

  Scenario: List search indexes when a data bag has been created
    Given a 'registration' named 'bobo' exists
      And a 'data_bag' named 'users' exists
     When I authenticate as 'bobo'
      And I 'GET' the path '/search'
     Then the inflated responses key 'node' should match '^http://(.+)/search/node$'
      And the inflated responses key 'role' should match '^http://(.+)/search/role$'
      And the inflated responses key 'client' should match '^http://(.+)/search/client$'
      And the inflated responses key 'users' should match '^http://(.+)/search/users$'
      And the inflated response should be '4' items long

  Scenario: List search indexes when you are not authenticated 
     When I 'GET' the path '/search' 
     Then I should get a '401 "Unauthorized"' exception

