home_page = HomePage.new

Given(/^visit homepage$/) do
  visit BaseConfig.url
end

And(/^close the popup$/) do
  home_page.close_the_pop_up
end

When(/^click on (stores) under (see_stores|store_login|open_a_free_store)$/) do |menu, submenu|
  home_page.click_menu_under_sub_menu menu, submenu
end

When(/^fill search box with (.*)$/) do |search_param|
  home_page.set_search_box(search_param)
end

And(/^click search button$/) do
  home_page.click_search_button
end

