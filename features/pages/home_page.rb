class HomePage

  def initialize
    @close_popup_button_id = "myLocation-close-info"
    @menu_item_css = ".hBotMenu > nav > ul > li:nth-of-type(5)"
    #  @menu_item_xpath = "//*[@title='Mağazalar']"
    @search_box_id = "searchData"
    @search_button_css = ".searchBtn"

  end

  def visit_home_page
    visit ""
  end

  def close_the_pop_up
    find(:id, @close_popup_button_id).click
  end

  def click_menu_under_sub_menu(menu, submenu)
    if menu == 'stores'
      find(@menu_item_css).hover
      find(:link, HOMEPAGE[:sub_menu][submenu.to_sym]).click
    end
  end

  def set_search_box(search_param)
    find(id: @search_box_id).send_keys(search_param)
  end

  def click_search_button
    find(@search_button_css).click
  end

end
