search_page = SearchPage.new

And(/^verify that the word has been corrected$/) do
  search_page.verify_closest_word
end

And(/^verify that the first product contains the searched word$/) do
  search_page.verify_searched_word
end

Then(/^open product (.*) on page "([^"]*)"$/) do |product_number, page_number|
  search_page.open_products product_number,page_number
end

Then(/^select second brand$/) do
  search_page.click_second_brand
end

Then(/^sort results by number of comments$/) do
  search_page.click_smart_sort
end

When(/^click on (smart_sorting) under (price_high|price_low|sales_volume|reviews|newest|review_rate|seller_grade)$/) do |dropdown_menu, submenu|
  search_page.click_dropdown_menu_under_submenu dropdown_menu, submenu
end

And(/^list products with free shipping$/) do
  search_page.list_free_shipping
end

Then(/^check if free shipping is selected$/) do
  search_page.verify_free_shipping_selected
end