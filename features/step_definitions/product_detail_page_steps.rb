product_detail_page = ProductDetailPage.new


Then(/^verify product page is open$/) do
  product_detail_page.verify_product_detail_page
end

And(/^add products to cart$/) do
  product_detail_page.add_to_basket
end

