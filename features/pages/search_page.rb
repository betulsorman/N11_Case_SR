class SearchPage

  def initialize
    @closest_word_text_xpath = "//*[normalize-space(text())='Aramana en yakın bulduğumuz']"
    @first_product_css = "#view > ul > li:nth-of-type(1) [class='productName']"
    @product_number_css = "#view > ul > li:nth-of-type(%s) [class='productName']"
    #  @product_number_xpath = '//div[@data-position="%s"]'
    @page_number_xpath = '//a[text()=%s]'
    @last_product_css = "#view > ul > li:last-of-type [class='productName']"
    @second_brand_checkbox_css = ".filterList div:nth-of-type(2) [value^='Marka[-]']"
    @smart_sort_id = "sortingType"
    ##sortingType > option:nth-child(5)
    @dropdown_value_xpath = "//*[text()='%s']"
    @free_shipping_id = "freeShippingOption"
    @selected_free_shipping_css = ".ticky"
  end

  def verify_closest_word
    page.should have_xpath(@closest_word_text_xpath)
  end

  def verify_searched_word
    expect(page).to have_css(@first_product_css, text: "iPhone")
  end

  def open_products(product_number, page_number)
    find(:xpath, @page_number_xpath % page_number, wait: 3).click
    if product_number == "last_product"
      find(@last_product_css).click
    else
      find(@product_number_css % product_number, wait: 3).click
    end
  end

  def click_second_brand
    find(@second_brand_checkbox_css, wait: 3).click
  end

  def click_smart_sort
    find(:id, @smart_sort_id).click
  end

  def click_dropdown_menu_under_submenu(dropdown_menu, submenu)
    if dropdown_menu == 'smart_sorting'
      find(:id, @smart_sort_id).click
      find(:xpath, @dropdown_value_xpath % HOMEPAGE[:dropdown_menu][submenu.to_sym]).click
    end
  end

  def list_free_shipping
    find(:id, @free_shipping_id).click
  end

  def verify_free_shipping_selected
    page.should have_selector(@selected_free_shipping_css)
  end
end

