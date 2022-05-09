Feature: N11 Case Test Suite

  Background:
    Given visit homepage
    And close the popup

    @regression
  Scenario: Printing an item to a CSV file and going to an item's page
    When click on stores under see_stores
    And click on all_stores
    Then export list with csv and select a store
    And open product 1 on page "1"
    And verify product page is open
    Then print store reviews

  @regression
  Scenario: Searching for a product and adding the product to the cart
    When fill search box with ayfone
    And click search button
    And verify that the word has been corrected
    And verify that the first product contains the searched word
    Then open product 1 on page "1"
    Then verify product page is open
    And add products to cart

  @regression
  Scenario: Searching product and sorting results
    When fill search box with telefon
    And click search button
    Then select second brand
    Then sort results by number of comments
    When click on smart_sorting under reviews
    And list products with free shipping
    Then check if free shipping is selected



