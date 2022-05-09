class StoreListingPage

  def initialize
    @all_stores_button_xpath = "//h3[text()='%s']"
    @store_name_xpath = "//*[text()='%s']"
    @letter_xpath = "//*[@title='S']"
  end

  def click_stores(tab)
    #  find(:xpath, @all_stores_button_xpath).click
    find(:xpath, @all_stores_button_xpath % HOMEPAGE[:stores_tabs][tab.to_sym]).click
  end

  def export_csv
    header = ["Stores"]
    CSV.open("stores.csv", "a") do |csv|
      row = CSV::Row.new(header, [])
      store_list = page.all('.sellerListHolder:nth-child(4)')
      store_list.each do |store|
        row["Stores"] = store.text
        csv << row
      end
    end
  end

  def stores_letters
    CSV.open("stores.csv", "wb") do |csv|
    letter_list = page.all(:xpath, "//*[@class=\"letters\"]/span")
      letter_list.each do |letter|
        letter.click
        sleep 0.5
        export_csv
         if letter.text == 'Z'
           break
         end
      end
    csv.close
    end
    end

  def get_second_store_starting_with_s
    unless File.exist?("stores.csv")
      puts "File not found"
      return
    end

    counter = 0
    File.open("stores.csv", "r").each_line do |store_name|
      if store_name.downcase[0] == 's'
        counter = counter + 1
        if counter == 2
          find(:xpath, @letter_xpath).click
          find(:xpath, @store_name_xpath %store_name.strip ).click
          break
        end
      end
    end
  end





end



