Feature: N11 Case Test Suite

  Background:
    Given visit homepage
    And close the popup

  Scenario: Task1
    When click on stores under see_stores
    Then click on all_stores
    Then export csv
    Then open product 1 on page 1
    Then verify product page is open
    And print store reviews


  Scenario: Task 2
    When fill search box with ayfone
    And click search button
    And verify that the word has been corrected
    And verify that the first product contains the searched word
    Then open product 1 on page 1
    Then verify product page is open
    And add products to cart

  Scenario: Task3
    When fill search box with telefon
    And click search button
    Then select second brand
   # And verify that the first product contains the searched word
 #   Then sort results by number of comments
    When click on smart_sorting under reviews
    And list products with free shipping
    Then check if free shipping is selected



