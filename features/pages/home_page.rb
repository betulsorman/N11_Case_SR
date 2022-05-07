class HomePage

  def initialize
    # @menu_items = ".hBotMenu > nav > ul > li:nth-of-type(5)"
    @menu_items = "//*[@title='%s']"
  end

  def visit_home_page
    visit ""
  end

  def click_menu_under_sub_menu(menu, submenu)
    if menu == 'best_sellers'
      find(:xpath, @menu_items %menu, HOMEPAGE[:menu][menu.to_sym]).click
      #   find(:link, HOMEPAGE[:sub_menu][submenu.to_sym]).click
      # else
      #  find(:link, HOMEPAGE[:menu][menu.to_sym]).click
    end
  end

end
