stores_page = StoreListingPage.new

  Then(/^click on (all_stores)$/) do |tab|
  stores_page.click_stores tab
end

Then(/^export list with csv and select a store$/) do
  stores_page.stores_letters
  stores_page.get_second_store_starting_with_s
end
