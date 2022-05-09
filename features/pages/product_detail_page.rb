class ProductDetailPage

  def initialize
    @add_to_basket_button_css = ".addBasketUnify"
    @store_reviews_ccs = ".showShopComTab"
  end
  def verify_product_detail_page
    page.should have_text("Sepete Ekle")
  end

  def add_to_basket
    find(@add_to_basket_button_css).click
  end




end

