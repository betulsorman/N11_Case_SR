store_page = StorePage.new


And(/^print store reviews$/) do
  store_page.print_store_reviews
end
