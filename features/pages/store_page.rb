class StorePage

  def initialize
    @store_reviews_ccs = ".showShopComTab"
  end

  def print_store_reviews
    store_reviews = find(@store_reviews_ccs).text
    puts store_reviews
  end

end