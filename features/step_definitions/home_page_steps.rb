home_page = HomePage.new

Given(/^visit homepage$/) do
  visit BaseConfig.url
end

When(/^clicks on (super_opportunities|campaigns|best_sellers|products_from_abroad|stores) under (see_stores|store_login|open_a_free_store)$/) do |menu, submenu|
  home_page.click_menu_under_sub_menu menu, submenu
end